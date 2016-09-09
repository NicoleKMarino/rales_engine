require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::RandomController, type: :request do
  describe "GET#show" do
    it 'returns a random invoice item' do
      create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/random"
      invoice_items = JSON.parse(response.body)
      item_response = invoice_items.first

      expect(response.status).to eq(200)
      expect(invoice_items.count).to eq(1)
      expect(item_response['id']).to be_truthy
      expect(item_response['updated_at']).to be_truthy
      expect(item_response['item_id']).to be_truthy
    end

    it 'returns empty array when there are no existing invoices' do
      get "/api/v1/invoice_items/random"
      item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(item)
    end
  end
end
