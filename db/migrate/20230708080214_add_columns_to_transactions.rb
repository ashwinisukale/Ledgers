class AddColumnsToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :requester_type, :string
    add_column :transactions, :source_type, :string
    add_column :transactions, :source_id, :integer
    add_column :transactions, :source_description, :string
    add_column :transactions, :destination_type, :string
    add_column :transactions, :destination_id, :integer
    add_column :transactions, :destination_description, :string
  end
end
