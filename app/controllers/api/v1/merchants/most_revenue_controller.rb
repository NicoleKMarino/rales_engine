class Api::V1::Merchants::MostRevenueController < Api::ApiController
  respond_to :json
  def show
    @merchant = Merchant.most_revenue(params[:quantity])
    respond_with @merchant
  end
end
