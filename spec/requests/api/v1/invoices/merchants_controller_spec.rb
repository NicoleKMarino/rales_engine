require 'rails_helper'

RSpec.describe Api::V1::Invoices::MerchantsController, type: :request do
  describe "GET#index" do
    it 'returns the merchant for the invoice' do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant: merchant)

      get "/api/v1/invoices/#{invoice.id}/merchant"
      merchant_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(merchant_response['id']).to eq(merchant.id)
      expect(merchant_response['name']).to eq(merchant.name)
      expect(merchant_response['created_at']).to be_truthy
      expect(merchant_response['updated_at']).to be_truthy
    end
  end
end
