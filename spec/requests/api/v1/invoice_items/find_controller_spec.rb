require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::FindController, type: :request do
  describe "GET#index" do

    it 'returns all existing invoice_items' do
      create_list(:invoice_item, 2)

      get "/api/v1/invoice_items/find_all"
      invoice_items = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(invoice_items.count)
    end

    it 'sends a list of one invoice_item' do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/find_all? item_id= #{invoice_item.item_id}"
      invoice_item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(1).to eq(invoice_item.count)
    end

    it 'returns empty array when there are no existing invoice_items' do
      get "/api/v1/invoice_items/find_all"
      invoice_item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(invoice_item)
    end
  end

  describe "GET#show" do
    it 'returns a single invoice_item' do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/find?#{invoice_item.id}"
      invoice_item_information = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(invoice_item.id).to eq(invoice_item_information["id"])
    end
  end
end
