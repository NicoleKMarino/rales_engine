class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  def self.find(params)
    self.find_by(params)
  end

  def self.find_all(params)
    self.where(params)
  end
end
