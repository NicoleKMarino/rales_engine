class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def show
    @merchant = Merchant.find(params[:id])
    if params[:date]
      date = params[:date]
      @revenue_by_date = @merchant.revenue_by_date(date)
      render :show_date
    else
      @revenue = @merchant.revenue.to_s
      render :show
    end
  end
end
