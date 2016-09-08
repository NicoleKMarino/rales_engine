require 'rails_helper'

RSpec.describe Api::V1::Items::MerchantsController, type: :request do
  describe "GET#index" do
    it 'returns the associated merchant for an item' do
      merchant = create(:merchant)
      item = create(:item, merchant: merchant)

      get "/api/v1/items/#{item.id}/merchant"
      item_merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(item_merchant['name']).to eq(merchant.name)
      expect(item_merchant['created_at']).to be_truthy
      expect(item_merchant['updated_at']).to be_truthy
    end
  end
end
