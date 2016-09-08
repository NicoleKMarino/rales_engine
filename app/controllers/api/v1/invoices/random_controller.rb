class Api::V1::Invoices::RandomController < Api::ApiController
  respond_to :json

  def show
   respond_with Invoice.random
 end
end
