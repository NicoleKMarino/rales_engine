require 'rails_helper'

RSpec.describe Api::V1::Invoices::FindController, type: :request do
  describe "GET#index" do

    it 'returns all existing invoices if no params specified' do
      create_list(:invoice, 2)

      get "/api/v1/invoices/find_all"
      invoices = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(invoices.count)
      expect(invoices.first['customer_id']).to be_truthy
      expect(invoices.first['merchant_id']).to be_truthy
      expect(invoices.first['status']).to be_truthy
      expect(invoices.first['created_at']).to be_truthy
      expect(invoices.first['updated_at']).to be_truthy
    end

    it 'sends a list of invoices with matching params' do
      merchant = create(:merchant)
      invoice_one = create(:invoice, merchant: merchant)
      invoice_two = create(:invoice, merchant: merchant)
      invoice_three = create(:invoice)

      get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"
      invoices = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(invoices.count)
      expect(invoices.first['merchant_id']).to eq(invoice_one.merchant_id)
      expect(invoices.last['merchant_id']).to eq(invoice_two.merchant_id)
      expect(invoices.first['merchant_id']).to_not eq(invoice_three.merchant_id)
    end

    it 'returns empty array when there are no existing invoices' do
      get "/api/v1/invoices/find_all"
      invoices = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(invoices)
    end
  end

  describe "GET#show" do
    it 'returns a single invoice' do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?#{invoice.id}"
      invoice_response = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(invoice_response['id']).to eq(invoice.id)
      expect(invoice_response['customer_id']).to eq(invoice.customer.id)
      expect(invoice_response['merchant_id']).to eq(invoice.merchant_id)
      expect(invoice_response['status']).to eq(invoice.status)
    end
  end
end
