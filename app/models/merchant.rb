class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices

  def revenue
    revenue = 0
    invoices = invoices.successful
    
  end

end
