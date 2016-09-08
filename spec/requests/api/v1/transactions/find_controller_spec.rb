require 'rails_helper'

RSpec.describe Api::V1::Transactions::FindController, type: :request do
  describe "GET#index" do

    it 'returns all existing transactions if no params specified' do
      create_list(:transaction, 2)

      get "/api/v1/transactions/find_all"
      transactions = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(transactions.count)
      expect(transactions.first['invoice_id']).to be_truthy
      expect(transactions.first['credit_card_number']).to be_truthy
      expect(transactions.first['result']).to be_truthy
      expect(transactions.first['created_at']).to be_truthy
      expect(transactions.first['updated_at']).to be_truthy
    end

    it 'sends a list of transactions with matching params' do
      invoice = create(:invoice)
      transaction_one = create(:transaction, invoice: invoice)
      transaction_two = create(:transaction, invoice: invoice)
      transaction_three = create(:transaction)

      get "/api/v1/transactions/find_all?invoice_id=#{invoice.id}"
      transactions = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(transactions.count)
      expect(transactions.first['invoice_id']).to eq(transaction_one.invoice_id)
      expect(transactions.last['invoice_id']).to eq(transaction_two.invoice_id)
      expect(transactions.first['invoice_id']).to_not eq(transaction_three.invoice_id)
    end

    it 'returns empty array when there are no existing transactions' do
      get "/api/v1/transactions/find_all"
      transactions = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(transactions)
    end
  end

  describe "GET#show" do
    it 'returns a single transaction' do
      invoice = create(:invoice)
      transaction = create(:transaction, invoice: invoice)

      get "/api/v1/transactions/find?transaction_id=#{transaction.id}"
      transaction_response = JSON.parse(response.body)
      # byebug

      expect(response.status).to eq(200)

      expect(transaction_response['id']).to eq(transaction.id)
      expect(transaction_response['invoice_id']).to eq(transaction.invoice_id)
      expect(transaction_response['result']).to eq(transaction.result)
      expect(transaction_response['created_at']).to be_truthy
      expect(transaction_response['updated_at']).to be_truthy
    end
  end
end
