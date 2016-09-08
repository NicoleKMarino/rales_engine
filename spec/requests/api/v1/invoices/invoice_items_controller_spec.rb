require 'rails_helper'

RSpec.describe Api::V1::Invoices::InvoiceItemsController, type: :request do
  describe "GET#index" do
    it 'returns the invoice items for the invoice' do
      invoice = create(:invoice)
      invoice_items = create(:invoice_item, invoice: invoice)

      get "/api/v1/invoices/#{invoice.id}/invoice_items"
      invoice_item = JSON.parse(response.body)
      invoice_item = invoice_item.first

      expect(response.status).to eq(200)
      expect(invoice_item['invoice_id']).to eq(invoice.id)
      expect(invoice_item['item_id']).to be_truthy
      expect(invoice_item['quantity']).to be_truthy
      expect(invoice_item['unit_price']).to be_truthy
      expect(invoice_item['created_at']).to be_truthy
      expect(invoice_item['updated_at']).to be_truthy
    end
  end
end
