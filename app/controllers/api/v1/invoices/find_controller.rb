class Api::V1::Invoices::FindController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.find_all(invoice_params)
  end

  def show
    respond_with Invoice.find_one(invoice_params)
  end

  private
    def invoice_params
      params.permit(
        :id,
        :customer_id,
        :merchant_id,
        :status,
        :created_at,
        :updated_at
      )
    end
end
