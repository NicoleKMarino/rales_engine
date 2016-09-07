class Api::V1::Merchants::MerchantsFinderController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.find_one(safe_params)
  end

  def index
    respond_with Merchant.find_all(safe_params)
  end

   private
     def safe_params
       params.permit(
        :id,
        :name,
        :merchant_id,
        :created_at,
        :updated_at
      )
     end
end
