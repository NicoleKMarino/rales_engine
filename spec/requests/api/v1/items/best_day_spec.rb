require 'rails_helper'

RSpec.describe Api::V1::Items::BestDayController, type: :request do
  describe "GET#show" do
    it "finds the day of the most sales for an item" do
      item = create(:item)
      invoice = create(:invoice, created_at: "2016-09-09T04:22:40.191Z")
      invoice_item = create(:invoice_item, invoice: invoice, item: item)
      create(:transaction, invoice: invoice, result: "success")

      get "/api/v1/items/#{item.id}/best_day"
      expect(response.status).to eq(200)

      best_day = JSON.parse(response.body)

      expect(best_day.count).to eq(1)
      expect(best_day['best_day']).to eq("2016-09-09T04:22:40.191Z")
    end
  end
end
