class Api::V1::Items::MostRevenueController < Api::ApiController
  respond_to :json
  def index
    @items = Item.most_revenue(params[:quantity])
    respond_with @items
  end
end
