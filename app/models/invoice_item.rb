class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  def self.find_one(params)
    self.find_by(params)
  end

  def self.find_all(params)
    self.where(params)
  end
end
