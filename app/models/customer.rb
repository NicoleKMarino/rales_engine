class Customer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :invoices
  has_many :transactions, through: :invoices
end
