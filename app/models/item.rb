class Item < ActiveRecord::Base
  belongs_to :merchant

  def self.find(params)
    self.find_by(params)
  end

  def self.find_all(params)
    self.where(params)
  end
end
