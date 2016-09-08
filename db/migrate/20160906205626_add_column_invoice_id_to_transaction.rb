class AddColumnInvoiceIdToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :invoice, foreign_key: true
    add_column :transactions, :credit_card_number, :string
    add_column :transactions, :credit_card_expiration_date, :string
    add_column :transactions, :result, :string
  end
end
