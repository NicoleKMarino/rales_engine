require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :request do
  describe "GET#index" do
    it 'returns all existing invoice_items' do
      create_list(:invoice_item, 2)

      get "/api/v1/invoice_items"
      invoice_items = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(invoice_items.count)
    end

    it 'sends a list of one invoice_item' do
      create(:invoice_item)

      get "/api/v1/invoice_items"
      invoice_item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(1).to eq(invoice_item.count)
    end

    it 'returns empty array when there are no existing invoices' do
      get "/api/v1/invoice_items"
      invoice_item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(invoice_item)
    end
  end

  describe "GET#show" do
    it 'returns a single invoice_item' do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/#{invoice_item.id}"
      invoice_information = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(invoice_item.id).to eq(invoice_information["id"])
      expect(invoice_item.quantity).to eq(invoice_information["quantity"])
    end
  end
end
