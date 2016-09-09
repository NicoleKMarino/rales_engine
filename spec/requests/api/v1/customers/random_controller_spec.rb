require 'rails_helper'

RSpec.describe Api::V1::Customers::RandomController, type: :request do
  describe "GET#show" do
    it 'returns a random invoice item' do
      create_list(:customer, 3)

      get "/api/v1/customers/random"
      customers = JSON.parse(response.body)
      customer_response = customers.first

      expect(response.status).to eq(200)
      expect(customers.count).to eq(1)
      expect(customer_response['id']).to be_truthy
      expect(customer_response['updated_at']).to be_truthy
      expect(customer_response['first_name']).to be_truthy
      expect(customer_response['last_name']).to be_truthy
    end

    it 'returns empty array when there are no existing customers' do
      get "/api/v1/customers/random"
      customer = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(customer)
    end
  end
end
