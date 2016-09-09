require 'rails_helper'

RSpec.describe Api::V1::Items::FindController, type: :request do
  describe "GET#index" do


    it 'returns all existing items if no params specified' do
      create_list(:item, 2)

      get "/api/v1/items/find_all"
      items = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(items.count)
    end

    it 'sends a list of one item' do
      item = create(:item)

      get "/api/v1/items/find_all?name = #{item.name}"
      items = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(1).to eq(items.count)
      expect(items.first['id']).to be_truthy
      expect(items.first['name']).to be_truthy
      expect(items.first['merchant_id']).to be_truthy
      expect(items.first['created_at']).to be_truthy
      expect(items.first['updated_at']).to be_truthy
    end

    it 'sends a list of items with matching params' do
      merchant = create(:merchant)
      item_one = create(:item, merchant: merchant)
      item_two = create(:item, merchant: merchant)
      item_three = create(:item)

      get "/api/v1/items/find_all?merchant_id=#{merchant.id}"
      items = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(items.count)
      expect(items.first['merchant_id']).to eq(item_one.merchant_id)
      expect(items.last['merchant_id']).to eq(item_two.merchant_id)
      expect(items.first['merchant_id']).to_not eq(item_three.merchant_id)
    end

    it 'returns empty array when there are no existing items' do
      get "/api/v1/items/find_all"
      items = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(items)
    end
  end

  describe "GET#show" do
    it 'returns a single item' do
      item = create(:item)

      get "/api/v1/items/find?#{item.id}"
      item_information = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(item.id).to eq(item_information["id"])
      expect(item.name).to eq(item_information["name"])
      item_response = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(item_response['id']).to eq(item.id)
      expect(item_response['name']).to eq(item.name)
      expect(item_response['merchant_id']).to eq(item.merchant.id)
      expect(item_response['created_at']).to be_truthy
      expect(item_response['updated_at']).to be_truthy
    end
  end
end
