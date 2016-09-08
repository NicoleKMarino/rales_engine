require 'rails_helper'

RSpec.describe Api::V1::Invoices::RandomController, type: :request do
  describe "GET#show" do
    it 'returns a random invoice' do
      create_list(:invoice, 3)

      get "/api/v1/invoices/random"
      invoice = JSON.parse(response.body)
      invoice_response = invoice.first

      expect(response.status).to eq(200)
      expect(invoice.count).to eq(1)
      expect(invoice_response['id']).to be_truthy
      expect(invoice_response['created_at']).to be_truthy
      expect(invoice_response['updated_at']).to be_truthy
      expect(invoice_response['customer_id']).to be_truthy
      expect(invoice_response['merchant_id']).to be_truthy
      expect(invoice_response['status']).to be_truthy
    end

    it 'returns empty array when there are no existing invoices' do
      get "/api/v1/invoices/random"
      invoice = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(invoice)
    end
  end
end
