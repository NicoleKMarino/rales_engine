class Api::V1::Invoices::TransactionsController < ApplicationController
  respond_to :json

  def index
    invoice = Invoice.find(params[:id])
    @transactions = invoice.transactions
    respond_with @transactions
  end
end
