class Api::V1::Transactions::FindController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.find_all(item_params)
  end

  def show
    respond_with Transaction.find_one(item_params)
  end

  private
    def item_params
      params.permit(
        :id,
        :created_at,
        :updated_at,
        :invoice_id,
        :credit_card_number,
        :result
      )
    end
end
