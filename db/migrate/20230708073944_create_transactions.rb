class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :activity_id
      t.datetime :date
      t.string :transaction_type
      t.string :method
      t.float :amount
      t.float :balance

      t.timestamps
    end
  end
end
