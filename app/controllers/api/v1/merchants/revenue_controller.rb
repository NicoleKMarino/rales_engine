class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json
  def show
    @merchant = Merchant.find(params[:id])
    respond_with @merchant.revenue
  end
end
