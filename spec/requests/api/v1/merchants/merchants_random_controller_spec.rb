require 'rails_helper'

RSpec.describe Api::V1::Merchants::RandomController, type: :request do
  describe "GET#show" do
    it 'sends a list of one random merchant' do
      merchant = create(:merchant)

      get "/api/v1/merchants/random"
      merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(1).to eq(merchant.count)
    end

    it 'returns empty array when there are no existing merchants' do
      get "/api/v1/merchants/random"
      merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect([]).to eq(merchant)
    end
  end
end
