class Api::V1::MerchantsController < Api::ApiController
  def index
    byebug
    @merchants = Merchant.where(safe_params).to_json
    render json: @merchants
  end

  def show
      @merchant = Merchant.find_by(safe_params).to_json
      render json: @merchant
  end


  def find
      @merchant = Merchant.find_by(safe_params).to_json
      render json: @merchant
  end

  def find_all
    if safe_params.empty?
      @merchants = Merchant.all.to_json
      render json: @merchants
    else
      @merchants = Merchant.find_by(safe_params).to_json
      render json: @merchants
    end
  end

  private
  def safe_params
    params.permit(:id,
                  :name)
  end


end
