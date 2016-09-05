class Api::V1::Items::FindController < ApplicationController
  respond_to :json

  def index
    respond_with Item.find_all(item_params)
  end

  def show
    respond_with Item.find(item_params)
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
        :updated_at)
    end
end
