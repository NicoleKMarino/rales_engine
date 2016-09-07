class Api::V1::Items::FindController < ApplicationController
  respond_to :json

  def index
    respond_with Item.find_all(item_params)
  end

  def show
    if params[:unit_price]
      respond_with Item.find_by(unit_price: params[:unit_price].to_i)
    else
      respond_with Item.find_one(item_params)
    end
  end

  private
    def item_params
      params.permit(
        :id,
        :name,
        :description,
        :unit_price,
        :merchant_id,
        :created_at,
        :updated_at
      )
    end
end
