require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :request do
  describe "GET#index" do
    it 'returns all existing transactions' do
      create_list(:transaction, 2)

      get "/api/v1/transactions"
      transactions = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(transactions.count)
    end

    it 'sends a list of one transaction' do
      create(:transaction)

      get "/api/v1/transactions"
      transaction = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(1).to eq(transaction.count)
    end

    it 'returns empty array when there are no existing transactions' do
      get "/api/v1/transactions"
      transaction = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(transaction)
    end
  end

  describe "GET#show" do
    it 'returns a single transaction' do
      transaction = create(:transaction)

      get "/api/v1/transactions/#{transaction.id}"
      transaction_information = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(transaction.id).to eq(transaction_information["id"])
      expect(transaction.credit_card_number).to eq(transaction_information["credit_card_number"])
    end
  end
end
