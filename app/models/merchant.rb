class Merchant < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :items
  has_many :invoices
end
