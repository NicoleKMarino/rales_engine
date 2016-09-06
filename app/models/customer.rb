class Customer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :invoices
end
