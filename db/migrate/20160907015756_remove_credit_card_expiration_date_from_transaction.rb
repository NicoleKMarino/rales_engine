class RemoveCreditCardExpirationDateFromTransaction < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :credit_card_expiration_date, :string
  end
end
