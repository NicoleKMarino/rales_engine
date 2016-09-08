class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.random
    limit(1).order("RANDOM()")
  end

  def to_decimal
    decimal = self.unit_price.to_f / 100
    decimal.to_s
  end

end
