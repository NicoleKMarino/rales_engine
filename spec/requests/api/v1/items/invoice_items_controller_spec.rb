require 'rails_helper'

RSpec.describe Api::V1::Items::InvoiceItemsController, type: :request do
  describe "GET#index" do
    it 'returns the associated invoice items for an item' do
      item = create(:item)
      invoice = create(:invoice)
      invoice_item = create(:invoice_item, item: item, invoice: invoice)

      get "/api/v1/items/#{item.id}/invoice_items"
      invoice_items = JSON.parse(response.body)
      response_invoice_item = invoice_items.first

      expect(response.status).to eq(200)
      expect(response_invoice_item['item_id']).to eq(item.id)
      expect(response_invoice_item['invoice_id']).to eq(invoice.id)
      expect(response_invoice_item['quantity']).to be_truthy
      expect(response_invoice_item['unit_price']).to be_truthy
      expect(response_invoice_item['created_at']).to be_truthy
      expect(response_invoice_item['updated_at']).to be_truthy
    end
  end
end
