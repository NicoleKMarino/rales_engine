class Api::V1::Items::BestDayController < ApplicationController
  respond_to :json

  def show
    @item = Item.find(params[:id])
    respond_with @item.best_day
  end
end
