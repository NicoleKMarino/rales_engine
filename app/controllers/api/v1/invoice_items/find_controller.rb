class Api::V1::InvoiceItems::FindController < ApplicationController
  respond_to :json

  def index
    if params[:unit_price]
      respond_with InvoiceItem.find_all(unit_price: to_integer(params[:unit_price]))
    else
      respond_with InvoiceItem.find_all(invoice_items_params)
    end
  end

  def show
    if params[:unit_price]
      respond_with InvoiceItem.find_by(unit_price: to_integer(params[:unit_price]))
    else
      respond_with InvoiceItem.find_one(invoice_items_params)
    end
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
        :updated_at
      )
    end
end
