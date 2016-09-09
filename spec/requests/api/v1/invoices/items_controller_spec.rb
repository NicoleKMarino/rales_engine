require 'rails_helper'

RSpec.describe Api::V1::Invoices::ItemsController, type: :request do
  describe "GET#index" do
    it 'returns the items for the invoice' do
      item = create(:item)
      invoice = create(:invoice)
      invoice_items = create(:invoice_item, invoice: invoice, item: item)

      get "/api/v1/invoices/#{invoice.id}/items"
      items = JSON.parse(response.body)
      item_response = items.first

      expect(response.status).to eq(200)
      expect(item_response['name']).to eq(item.name)
      expect(item_response['description']).to eq(item.description)
      expect(item_response['unit_price']).to eq(item.unit_price)
      expect(item_response['merchant_id']).to eq(item.merchant_id)
      expect(item_response['created_at']).to be_truthy
      expect(item_response['updated_at']).to be_truthy
    end
  end
end
