class Api::V1::Merchants::RandomController < Api::ApiController
  respond_to :json

  def show
   respond_with Merchant.limit(1).order("RANDOM()")
 end
end
