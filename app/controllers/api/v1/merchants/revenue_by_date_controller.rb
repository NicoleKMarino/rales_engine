class Api::V1::Merchants::RevenueByDateController < Api::ApiController
  respond_to :json

  def index
    @total = total_revenue_by_date(params[:date])
    respond_with @total
  end

  def total_revenue_by_date(date)
    total = []
    Merchant.all.map do |merchant|
      revenue = merchant.revenue_by_date(params[:date])
      total << revenue.to_i
    end
    total.sum
  end



end
