require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :request do
  describe "GET#index" do
    it 'returns all existing customers' do
      create_list(:customer, 2)

      get "/api/v1/customers"
      customers = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(customers.count)
    end

    it 'sends a list of one customer' do
      create(:customer)

      get "/api/v1/customers"
      customer = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(1).to eq(customer.count)
    end

    it 'returns empty array when there are no existing customers' do
      get "/api/v1/customers"
      customer = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(customer)
    end
  end

  describe "GET#show" do
    it 'returns a single customer' do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}"
      customer_information = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(customer.id).to eq(customer_information["id"])
      expect(customer.first_name).to eq(customer_information["first_name"])
      expect(customer.last_name).to eq(customer_information["last_name"])
    end
  end
end
