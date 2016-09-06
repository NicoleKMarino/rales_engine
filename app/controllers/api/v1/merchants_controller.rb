class Api::V1::MerchantsController < Api::ApiController
  respond_to :json


  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    respond_with Merchant.find_by(safe_params)
  end

  def find_all
    respond_with Merchant.where(safe_params)
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
                  :merchant_id)
  end

end
