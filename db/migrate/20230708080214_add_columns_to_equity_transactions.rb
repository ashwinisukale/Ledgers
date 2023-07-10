class AddColumnsToEquityTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :equity_transactions, :requester_type, :string
    add_column :equity_transactions, :source_type, :string
    add_column :equity_transactions, :source_id, :integer
    add_column :equity_transactions, :source_description, :string
    add_column :equity_transactions, :destination_type, :string
    add_column :equity_transactions, :destination_id, :integer
    add_column :equity_transactions, :destination_description, :string
  end
end
