require 'csv'

namespace :csv_data do
  desc "Import all from CSV"

    task :import_merchants => :environment do
      CSV.foreach("#{Rails.root}/db/data/merchants.csv", :headers => true) do |row|
      Merchant.create!(row.to_hash)
      end
    end

    task :import_customers => :environment do
      CSV.foreach("#{Rails.root}/db/data/customers.csv", :headers => true) do |row|
      Customer.create!(row.to_hash)
      end
    end

    task :import_items=> :environment do
      CSV.foreach("#{Rails.root}/db/data/items.csv", :headers => true) do |row|
      Item.create!(row.to_hash)
      end
    end

    task :import_invoice_items => :environment do
      CSV.foreach("#{Rails.root}/db/data/invoice_items.csv", :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
      end
    end

    task :import_invoices=> :environment do
      CSV.foreach("#{Rails.root}/db/data/invoices.csv", :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end
  end

    task :import_transactions=> :environment do
      CSV.foreach("#{Rails.root}/db/data/transactions.csv", :headers => true) do |row|
      Transaction.create!(row.to_hash)
      end
    end


    task :import_all => :environment do
      Rake::Task["csv_data:import_merchants"].invoke
      Rake::Task["csv_data:import_customers"].invoke
      Rake::Task["csv_data:import_items"].invoke
      Rake::Task["csv_data:import_invoices"].invoke
      Rake::Task["csv_data:import_invoice_items"].invoke
      Rake::Task["csv_data:import_transactions"].invoke
    end

end
