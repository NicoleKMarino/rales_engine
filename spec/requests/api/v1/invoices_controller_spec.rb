require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :request do
  describe "GET#index" do
    it 'returns all existing invoices' do
      create_list(:invoice, 2)

      get "/api/v1/invoices"
      invoices = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(invoices.count)
    end

    it 'sends a list of one invoice' do
      create(:invoice)

      get "/api/v1/invoices"
      invoice = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(1).to eq(invoice.count)
    end

    it 'returns empty array when there are no existing invoices' do
      get "/api/v1/invoices"
      invoice = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(invoice)
    end
  end

  describe "GET#show" do
    it 'returns a single invoice' do
      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}"
      invoice_information = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(invoice.id).to eq(invoice_information["id"])
      expect(invoice.status).to eq(invoice_information["status"])
    end
  end
end
