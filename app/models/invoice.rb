class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :transactions

  def self.find(params)
    self.find_by(params)
  end

  def self.find_all(params)
    self.where(params)
  end
end
