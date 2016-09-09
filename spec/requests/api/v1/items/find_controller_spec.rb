require 'rails_helper'

RSpec.describe Api::V1::Items::FindController, type: :request do
  describe "GET#index" do

    it 'returns all existing items' do
      create_list(:item, 2)

      get "/api/v1/items/find_all"
      items = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(items.count)
    end

    it 'sends a list of one item' do
      item = create(:item)

      get "/api/v1/items/find_all?name = #{item.name}"
      item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(1).to eq(item.count)
    end

    it 'returns empty array when there are no existing items' do
      get "/api/v1/items/find_all"
      item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(item)
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
    end
  end
end
