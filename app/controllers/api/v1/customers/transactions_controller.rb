class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def index
    customer = Customer.find(params[:id])
    @transactions = customer.transactions
    respond_with @transactions
  end
end
