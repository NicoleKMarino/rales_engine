class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    customer = Customer.find(params[:id])
    respond_with customer
  end
end
