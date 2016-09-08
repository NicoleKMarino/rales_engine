require 'rails_helper'

RSpec.describe Api::V1::Invoices::TransactionsController, type: :request do
  describe "GET#index" do
    it 'returns the transaction for the invoice' do
      invoice = create(:invoice)
      transaction = create(:transaction, invoice: invoice)

      get "/api/v1/invoices/#{invoice.id}/transactions"
      transactions_response = JSON.parse(response.body)
      transactions = transactions_response.first

      expect(response.status).to eq(200)
      expect(transactions['invoice_id']).to eq(invoice.id)
      expect(transactions['credit_card_number']).to eq(transaction.credit_card_number)
      expect(transactions['result']).to eq(transaction.result)
      expect(transactions['created_at']).to be_truthy
      expect(transactions['updated_at']).to be_truthy
    end
  end
end
