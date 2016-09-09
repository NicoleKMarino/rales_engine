require 'rails_helper'

RSpec.describe Api::V1::Transactions::InvoicesController, type: :request do
  describe "GET#show" do
    it 'returns the invoice for a transaction' do
      invoice = create(:invoice)
      transaction = create(:transaction, invoice: invoice)

      get "/api/v1/transactions/#{transaction.id}/invoice"
      invoice_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(invoice_response['id']).to eq(invoice.id)
      expect(invoice_response['customer_id']).to eq(invoice.customer_id)
      expect(invoice_response['merchant_id']).to eq(invoice.merchant_id)
      expect(invoice_response['created_at']).to be_truthy
    end
  end
end
