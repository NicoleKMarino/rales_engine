json.(@items) do |item|
  json.(item, :id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id)
  json.unit_price(item.to_decimal)
end
