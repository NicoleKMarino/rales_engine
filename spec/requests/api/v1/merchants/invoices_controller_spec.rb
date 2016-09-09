require 'rails_helper'

RSpec.describe Api::V1::Merchants::InvoicesController, type: :request do
  describe "GET#index" do

    it 'returns all existing invoices' do
      merchant = create(:merchant)
      customer = create(:customer)

      Invoice.create(customer_id: customer.id, merchant_id: merchant.id)
      Invoice.create(customer_id: customer.id, merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/invoices"
      merchants = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(merchants.count)
    end

    it 'returns empty array when there are no existing merchants' do
      merchant = create(:merchant)

      get "/api/v1/merchants/#{merchant.id}/invoices"
      merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(merchant)
    end
  end
end
