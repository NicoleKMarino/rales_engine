require 'rails_helper'

RSpec.describe Api::V1::Invoices::CustomersController, type: :request do
  describe "GET#index" do
    it 'returns the customer from an invoice' do
      customer = create(:customer)
      invoice = create(:invoice, customer: customer)

      get "/api/v1/invoices/#{invoice.id}/customer"
      customer_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(customer_response['first_name']).to eq(customer.first_name)
      expect(customer_response['last_name']).to eq(customer.last_name)
      expect(customer_response['created_at']).to be_truthy
      expect(customer_response['updated_at']).to be_truthy
    end
  end
end
