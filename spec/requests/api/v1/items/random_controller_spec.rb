require 'rails_helper'

RSpec.describe Api::V1::Items::RandomController, type: :request do
  describe "GET#show" do
    it 'returns a random item' do
      create_list(:item, 3)

      get "/api/v1/items/random"
      items = JSON.parse(response.body)
      item_response = items.first

      expect(response.status).to eq(200)
      expect(items.count).to eq(1)
      expect(item_response['id']).to be_truthy
      expect(item_response['created_at']).to be_truthy
      expect(item_response['updated_at']).to be_truthy
      expect(item_response['name']).to be_truthy
      expect(item_response['merchant_id']).to be_truthy
    end

    it 'returns empty array when there are no existing invoices' do
      get "/api/v1/items/random"
      item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(item)
    end
  end
end
