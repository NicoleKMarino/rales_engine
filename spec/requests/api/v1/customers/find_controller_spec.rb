require 'rails_helper'

RSpec.describe Api::V1::Customers::FindController, type: :request do
  describe "GET#index" do

    it 'sends a list of customers with matching params' do
        customer = create(:customer)
        get "/api/v1/customers/find_all?first_name = #{customer.first_name}"
        customers = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(1).to eq(customers.count)
      end

    it 'returns empty array when there are no existing customers' do
      get "/api/v1/customers/find_all"
      customers = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(customers)
    end
  end

  describe "GET#show" do
    it 'returns a single customer' do
      customer = create(:customer)

      get "/api/v1/customers/find?#{customer.id}"
      customer_response = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(customer_response['id']).to eq(customer.id)
      expect(customer_response['first_name']).to eq(customer.first_name)
      expect(customer_response['last_name']).to eq(customer.last_name)
    end
  end
end
