class Api::V1::Merchants::MerchantsFinderController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.find_by(safe_params)
  end

  def index
    respond_with Merchant.where(safe_params)
  end

  def random
   respond_with Merchant.limit(1).order("RANDOM()")
 end

  private
  def safe_params
    params.permit(:id,
                  :name)
  end

end
