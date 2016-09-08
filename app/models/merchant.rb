class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices

  def revenue
    invoice_items = Invoice.successful.where(merchant_id: self.id).joins(:invoice_items).pluck(:quantity, :unit_price)
    revenue = invoice_items.map do |quantity, unit_price|
      quantity * unit_price
    end.reduce(:+)
    { "revenue" => "#{revenue.to_f / 100}" }
  end

  def customers_with_pending_invoices
    customer_ids = Invoice.failed.where(merchant_id: self.id).pluck(:customer_id).uniq
    customer_ids.map do |customer_id|
      { "customer_id" => customer_id }
    end
  end

  def self.find_one(params)
    self.find_by(params)
  end

  def self.find_all(params)
    self.where(params)
  end
end
