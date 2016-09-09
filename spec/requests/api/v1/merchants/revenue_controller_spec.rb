require 'rails_helper'

RSpec.describe Api::V1::Merchants::RevenueController, type: :request do
  describe "GET#index" do
    it 'returns revenue for a specific merchant' do
      merchant_one = create(:merchant)
      merchant_two = create(:merchant)
      invoice = create(:invoice, merchant: merchant_one)
      invoice_item = create(:invoice_item, invoice: invoice, quantity: 1, unit_price: 1000)
      transaction = create(:transaction, invoice: invoice)

      get "/api/v1/merchants/#{merchant_one.id}/revenue"
      merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(merchant["revenue"]).to eq("10.0")
    end

    it 'returns the merchant with the highest revenue by date if provided' do
      merchant_one = create(:merchant)
      merchant_two = create(:merchant)
      invoice = create(:invoice, merchant: merchant_one, created_at: "2016-03-04 11:00:05")
      invoice_item = create(:invoice_item, invoice: invoice, quantity: 1, unit_price: 1000)
      transaction = create(:transaction, invoice: invoice)

      get "/api/v1/merchants/#{merchant_one.id}/revenue?2016-03-04%2011:00:05"
      merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(merchant["revenue"]).to eq("10.0")
    end
  end
end
