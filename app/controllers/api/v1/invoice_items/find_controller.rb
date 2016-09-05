class Api::V1::InvoiceItems::FindController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItems.find_all(invoice_items_params)
  end

  def show
    respond_with InvoiceItems.find(invoice_items_params)
  end

  private
    def invoice_items_params
      params.permit(
        :id,
        :item_id,
        :invoice_id,
        :quantity,
        :unit_price,
        :created_at,
        :updated_at)
    end
end
