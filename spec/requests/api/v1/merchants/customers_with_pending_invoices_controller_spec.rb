require 'rails_helper'

RSpec.describe Api::V1::Merchants::CustomersWithPendingInvoicesController, type: :request do
  describe "GET#show" do

    it 'returns unique list of customers with pending invoices for a specific merchant' do
      merchant          = create(:merchant)
      customer_one      = create(:customer)
      customer_two      = create(:customer)
      customer_three    = create(:customer)
      invoice_one       = create(:invoice, customer: customer_one, merchant: merchant)
      invoice_two       = create(:invoice, customer: customer_one, merchant: merchant)
      invoice_three     = create(:invoice, customer: customer_two, merchant: merchant)
      transaction_one   = create(:transaction, invoice: invoice_one, result: "failed")
      transaction_two   = create(:transaction, invoice: invoice_two, result: "failed")
      transaction_three = create(:transaction, invoice: invoice_three, result: "failed")
      transaction_four  = create(:transaction)

      get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
      pending_customers = JSON.parse(response.body)
      first_pending = pending_customers.first
      second_pending = pending_customers.last

      expect(response.status).to eq(200)
      expect(pending_customers.count).to eq(2)
      expect(first_pending['customer_id']).to eq(customer_one.id)
      expect(second_pending['customer_id']).to eq(customer_two.id)
    end
  end
end
