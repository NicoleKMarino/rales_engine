require 'rails_helper'

RSpec.describe Api::V1::Customers::InvoicesController, type: :request do
  describe "GET#index" do
    it 'returns all invoices for a customer' do
      customer = create(:customer)
      invoice = create(:invoice, customer: customer)
      invoice = create(:invoice, customer: customer)

      get "/api/v1/customers/#{customer.id}/invoices"
      transactions = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(transactions.count).to eq(2)
    end

    it 'returns empty array when there are no existing transactions for a customer' do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}/transactions"
      customer_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(customer_response).to eq([])
    end
  end
end
