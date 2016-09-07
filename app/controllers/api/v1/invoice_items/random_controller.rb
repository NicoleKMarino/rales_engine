class Api::V1::InvoiceItems::RandomController < Api::ApiController
  respond_to :json

  def show
   respond_with InvoiceItem.random
 end
end
