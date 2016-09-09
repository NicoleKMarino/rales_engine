require 'rails_helper'

RSpec.describe Api::V1::Merchants::FavoriteCustomerController, type: :request do
  describe "GET#show" do
    it "returns customer for a specific merchant with the most purchases" do
      merchant= create(:merchant)
      customer_one, customer_two = create_list(:customer, 2)
      invoice_one = create(:invoice, customer: customer_one, merchant: merchant)
      invoice_two = create(:invoice, customer: customer_two, merchant: merchant)
      transaction_one = create(:transaction, invoice: invoice_one, result: "failed")
      transaction_two = create(:transaction, invoice: invoice_two)

      get "/api/v1/merchants/#{merchant.id}/favorite_customer"
      favorite_customer = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(favorite_customer["id"]).to eq customer_two.id
    end
  end
end
