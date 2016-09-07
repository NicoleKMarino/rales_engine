class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
    respond_with @items
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
