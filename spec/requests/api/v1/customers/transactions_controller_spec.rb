require 'rails_helper'

RSpec.describe Api::V1::Customers::TransactionsController, type: :request do
  describe "GET#index" do
    it 'returns all transactions for a customer' do
      customer = create(:customer)
      invoice = create(:invoice, customer: customer)
      transaction = create(:transaction, invoice: invoice)
      transaction = create(:transaction, invoice: invoice)

      get "/api/v1/customers/#{customer.id}/transactions"
      transactions = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(transactions.count)
    end

    it 'returns empty array when there are no existing transactions for a customer' do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}/transactions"
      customer = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(customer)
    end
  end
end
