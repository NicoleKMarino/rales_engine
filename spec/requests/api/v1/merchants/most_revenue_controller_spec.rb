require "rails_helper"

RSpec.describe Api::V1::Merchants::MostRevenueController do
  it "returns the top x merchants by revenue" do
    merchant_one = create(:merchant)
    merchant_two = create(:merchant)
    invoice = create(:invoice, merchant: merchant_one)
    create(:transaction, invoice: invoice)
    create(:invoice_item, invoice: invoice)

    get "/api/v1/merchants/most_revenue?quantity=1"
    top_merchant = JSON.parse(response.body)

    expect(response.status).to eq 200

    expect(top_merchant.first["id"]).to eq(merchant_one.id)
    expect(top_merchant.first["name"]).to eq(merchant_one.name)
  end
end
