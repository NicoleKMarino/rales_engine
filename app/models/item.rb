class Item < ApplicationRecord
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

  def best_day
    date = invoices.successful
      .select("created_at")
      .group("created_at")
      .order("sum(quantity)DESC")
      .first["created_at"]
    { best_day: date }
  end

  def self.most_revenue(quantity)
    self.joins(:invoice_items).group(:id).order('sum(invoice_items.quantity * invoice_items.unit_price)DESC').limit(quantity)
  end

  def self.most_items(quantity)
    joins(:invoice_items).group(:id).order('sum(invoice_items.quantity) desc').limit(quantity)
  end
end
