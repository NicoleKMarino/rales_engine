class Api::V1::Customers::FindController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.find_all(customer_params)
  end

  def show
    respond_with Customer.find_one(customer_params)
  end

  private
    def customer_params
      params.permit(
        :id,
        :first_name,
        :last_name,
        :created_at,
        :updated_at)
    end
end
