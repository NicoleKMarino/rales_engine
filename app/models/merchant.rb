class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices

  def revenue
    revenue = 0
    invoices = invoices.successful
  end

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
