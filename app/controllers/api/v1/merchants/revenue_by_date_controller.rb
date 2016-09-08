class Api::V1::Merchants::RevenueByDateController < Api::ApiController
  respond_to :json

  def index
    @total = total_revenue_by_date(params[:date])
    respond_with @total
  end


  def total_revenue_by_date(date)
    total = 0
    Merchant.all.each do |merchant|
      merchant.revenue_by_date(params[:date]).first + total
      byebug
    end
    byebug
    total
  end

end
