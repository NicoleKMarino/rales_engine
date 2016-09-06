class Api::V1::TransactionsController < Api::ApiController
  respond_to :json
  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end

  def invoice
    @transaction = Transaction.find(params[:transaction_id])
    respond_with @transaction.invoice
  end
end
