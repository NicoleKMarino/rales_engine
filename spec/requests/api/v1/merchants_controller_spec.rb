require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :request do
  describe "GET#index" do
    it 'returns all existing merchants' do
      create_list(:merchant, 2)

      get "/api/v1/merchants"
      merchants = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(merchants.count)
    end

    it 'sends a list of one merchant' do
      create(:merchant)

      get "/api/v1/merchants"
      merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(1).to eq(merchant.count)
    end

    it 'returns empty array when there are no existing merchants' do
      get "/api/v1/merchants"
      merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(merchant)
    end
  end

  describe "GET#show" do
    it 'returns a single merchant' do
      merchant = create(:merchant)

      get "/api/v1/merchants/#{merchant.id}"
      merchant_information = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(merchant.id).to eq(merchant_information["id"])
      expect(merchant.name).to eq(merchant_information["name"])
    end
  end
end
