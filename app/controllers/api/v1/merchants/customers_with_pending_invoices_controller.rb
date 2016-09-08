class Api::V1::Merchants::CustomersWithPendingInvoicesController < Api::ApiController
  respond_to :json
  def show
    @merchant = Merchant.find(params[:id])
    respond_with @merchant.customers_with_pending_invoices
  end
end
