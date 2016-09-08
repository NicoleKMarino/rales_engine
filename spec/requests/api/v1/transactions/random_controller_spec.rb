require 'rails_helper'

RSpec.describe Api::V1::Transactions::RandomController, type: :request do
  describe "GET#show" do
    it 'returns a random transaction' do
      create_list(:transaction, 3)

      get "/api/v1/transactions/random"
      transactions = JSON.parse(response.body)
      transaction = transactions.first

      expect(response.status).to eq(200)
      expect(transactions.count).to eq(1)
      expect(transaction['id']).to be_truthy
      expect(transaction['created_at']).to be_truthy
      expect(transaction['updated_at']).to be_truthy
      expect(transaction['invoice_id']).to be_truthy
      expect(transaction['result']).to be_truthy
      expect(transaction['credit_card_number']).to be_truthy

    end

    it 'returns empty array when there are no existing transactions' do
      get "/api/v1/transactions/random"
      transaction = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(transaction)
    end
  end
end
