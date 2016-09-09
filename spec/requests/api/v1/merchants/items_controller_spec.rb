require 'rails_helper'

RSpec.describe Api::V1::Merchants::ItemsController, type: :request do
  describe "GET#index" do

    it 'returns all existing items' do
      merchant = create(:merchant)
      Item.create(name:"test", merchant_id: merchant.id)
      Item.create(name:"test", merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/items"
      merchants = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(merchants.count)
    end

    it 'returns empty array when there are no existing merchants' do
      merchant = create(:merchant)

      get "/api/v1/merchants/#{merchant.id}/items"
      merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(merchant)
    end
  end
end
