json.(@transactions) do |transaction|
  json.(transaction, :id, :credit_card_number, :created_at, :updated_at, :invoice_id, :result)
end
