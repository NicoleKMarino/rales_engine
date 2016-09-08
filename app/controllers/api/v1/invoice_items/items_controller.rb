class Api::V1::InvoiceItems::ItemsController < ApplicationController
  respond_to :json

  def show
    invoice_item = InvoiceItem.find(params[:id])
    @item = invoice_item.item
    respond_with @item
  end
end
