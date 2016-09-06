class Api::V1::CustomersController < Api::ApiController
  respond_to :json

  def index
    respond_with Customers.all
  end

  def show
    @customer = Customer.find(params[:id])
    respond_with @customer
  end

  def invoices
    @customer = Customer.find(params[:customer_id])
    respond_with @customer.invoices
  end

  def transactions
    @customer = Customer.find(params[:customer_id])
    respond_with @customer.transactions
  end
end
