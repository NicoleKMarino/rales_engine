class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def invoice
    @invoice_item = InvoiceItem.find(id: params[:invoice_item_id])
    respond_with @invoice_item.invoice
  end

  def item
    @invoice_item = InvoiceItem.find(id: params[:invoice_item_id])
    respond_with @invoice_item.item
  end
end
