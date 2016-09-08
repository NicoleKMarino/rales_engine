class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    @invoice_items = InvoiceItem.all
    respond_with @invoice_items
  end

  def show
    @invoice_item = InvoiceItem.find(params[:id])
    respond_with @invoice_item
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
