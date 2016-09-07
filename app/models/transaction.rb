class Transaction < ApplicationRecord
  belongs_to :invoice

  validates :credit_card_number, presence: true
  validates :result, presence: true

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
