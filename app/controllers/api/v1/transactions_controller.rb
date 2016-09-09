class Api::V1::TransactionsController < Api::ApiController
  respond_to :json
  
  def index
    @transactions = Transaction.all
    respond_with @transactions
  end

  def show
    respond_with Transaction.find(params[:id])
  end
end
