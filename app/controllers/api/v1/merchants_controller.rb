class Api::V1::MerchantsController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def items
    respond_with Merchant.find(safe_params[:merchant_id]).items
  end

  def invoices
    respond_with Merchant.find(safe_params[:merchant_id]).invoices
  end

  private
    def safe_params
      params.permit(:id,
                    :name,
                    :merchant_id,
                    :created_at,
                    :updated_at)
    end
end
