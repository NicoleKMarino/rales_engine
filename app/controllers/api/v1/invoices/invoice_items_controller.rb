class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    invoice = Invoice.find(params[:id])
    respond_with invoice.invoice_items
  end
end
