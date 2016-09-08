FactoryGirl.define do

  sequence :first_name do |n|
    "First Name #{n}"
  end

  sequence :last_name do |n|
    "Last Name #{n}"
  end

  sequence :name do |n|
    "Merchant #{n}"
  end

  sequence :credit_card_number do |n|
    n
  end

  factory :customer do
    first_name { generate(:first_name) }
    last_name { generate(:last_name) }
  end

  factory :transaction do
    invoice
    credit_card_number { generate(:credit_card_number) }
    result "success"
  end

  factory :merchant do
    name { generate(:name) }
  end

  factory :item do
    name { generate(:name) }
    merchant
  end

  factory :invoice do
    status "shipped"
    customer
    merchant
  end

  factory :invoice_item do
    item
    invoice
    quantity 1
  end
end
