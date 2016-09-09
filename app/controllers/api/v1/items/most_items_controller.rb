class Api::V1::Items::MostItemsController < Api::ApiController
  respond_to :json
  
  def index
    @items = Item.most_items(params[:quantity])
    respond_with @items
  end
end
