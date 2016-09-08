class Api::V1::Merchants::ItemsController < ApplicationController
  respond_to :json

  def index
    @merchant= Merchant.find(params[:id])
    respond_with @merchant.items
  end
end
