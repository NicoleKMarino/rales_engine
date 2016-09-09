require 'rails_helper'

include TestHelper
RSpec.describe Api::V1::Invoices::ItemsController, type: :request do
  describe "GET#show" do
    it 'returns the invoice from an invoice_item' do
    item = create(:item, id: 1)
    invoice_item = create(:invoice_item, item_id: item.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_success

    expect(json["id"]).to eq(1)
    expect(json.count).to eq(7)
    end
  end
end 
