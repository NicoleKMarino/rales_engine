class Api::V1::Items::FindController < ApplicationController
  respond_to :json

  def index
    if params[:unit_price]
      respond_with Item.find_all(unit_price: to_integer(params[:unit_price]))
    else
      respond_with Item.find_all(item_params)
    end
  end

  def show
    if params[:unit_price]
      respond_with Item.find_by(unit_price: to_integer(params[:unit_price]))
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
