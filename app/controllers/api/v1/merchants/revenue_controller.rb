class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def show
    @merchant = Merchant.find(params[:id])
    if params[:date]
      respond_with @merchant.revenue_by_date(params[:date])
    else
      @revenue = @merchant.revenue.to_s
      respond_with @revenue 
    end
  end

end
