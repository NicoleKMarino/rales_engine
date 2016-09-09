require 'rails_helper'
include TestHelper

RSpec.describe Api::V1::Items::MostItemsController, type: :request do
  describe "GET#index" do
    it 'returns the item that was sold most' do
       merchant      = create(:merchant, id: 1)
       merchant2     = create(:merchant, id: 2)
       item          = create(:item, id: 22, name: 'test', merchant_id: 1)
       item2         = create(:item, id: 23, name: 'tester', merchant_id: 2)
       invoice       = create(:invoice, id: 1)
       invoice2      = create(:invoice, id: 2)
       transaction   = create(:transaction, id: 1, invoice_id: 2)
       transaction2  = create(:transaction, id: 2, invoice_id: 1)
       invoice_item1 = create(:invoice_item, id: 1, invoice_id: 2, item_id: 22)
       invoice_item2 = create(:invoice_item, id: 2, invoice_id: 2, item_id: 22)
       invoice_item3 = create(:invoice_item, id: 3, invoice_id: 2, item_id: 22)
       invoice_item4 = create(:invoice_item, id: 23, invoice_id: 1, item_id: 23)

       get "/api/v1/items/most_items?quantity=2"

       expect(response).to be_success

       expect(json.first["id"]).to eq(22)
       expect(json.first["name"]).to eq("test")
       expect(json.first.count).to eq(7)
     end
   end
end
