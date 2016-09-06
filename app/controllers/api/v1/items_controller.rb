class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def invoice_items
    @item = Item.find(id: params[:item_id])
    respond_with @item.invoice_items
  end

  def merchant
    @item = Item.find(id: params[:item_id])
    respond_with @item.merchant
  end
end
