require 'rails_helper'

RSpec.describe Item, Item: :model do
  it { should validate_presence_of :name}
  it { should belong_to :merchant}
  it { should have_many :invoice_items}
end
