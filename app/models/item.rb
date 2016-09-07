class Item < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.find_one(params)
    self.find_by(params)
  end

  def self.find_all(params)
    self.where(params)
  end

  def self.random
    self.limit(1).order("RANDOM()")
  end
end
