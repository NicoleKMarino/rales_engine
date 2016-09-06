require 'rails_helper'

RSpec.describe Item, Item: :model do
  it { should validate_presence_of :name}
end
