class Api::V1::Items::MostRevenueController < Api::ApiController
  respond_to :json
  def index
    @merchant = Item.most_revenue(params[:quantity])
    respond_with @merchant
  end
end
