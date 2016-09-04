class Api::V1::MerchantsController < Api::ApiController
  respond_to :json
  
  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(safe_params)
  end

  private
  def safe_params
    params.permit(:id,
                  :name)
  end
end
