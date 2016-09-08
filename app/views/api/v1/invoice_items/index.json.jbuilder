json.(@invoice_items) do |invoice_item|
  json.(invoice_item, :id,:unit_price,:invoice_id,:item_id,:quantity, :created_at, :updated_at)
  json.unit_price(invoice_item.to_decimal)
end
