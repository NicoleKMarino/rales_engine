class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def revenue
    revenue = self.invoices
      .successful
      .joins(:invoice_items)
      .sum('quantity * unit_price')
    { "revenue" => to_decimal(revenue).to_s }
  end

  def customers_with_pending_invoices
    customer_ids = Invoice.failed
      .where(merchant_id: self.id)
      .pluck(:customer_id).uniq
    customer_ids.map do |customer_id|
      { "customer_id" => customer_id }
    end
  end

  def favorite_customer
    customer = self.invoices
      .successful
      .group(:customer_id)
      .order('count_id DESC')
      .limit(1)
      .count(:id).first.first
    { id: customer }
  end

  def self.find_one(params)
    self.find_by(params)
  end

  def self.find_all(params)
    self.where(params)
  end

  def to_decimal(number)
    (number.to_f / 100).round(2)
  end
end
