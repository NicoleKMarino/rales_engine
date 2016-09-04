class Api::V1::MerchantsFinderController < Api::ApiController
  respond_to :json

  def find
    respond_with Merchant.find_by(safe_params)
  end

  def find_all
    respond_with Merchant.where(safe_params)
  end

  private
  def safe_params
    params.permit(:id,
                  :name)
  end

end
