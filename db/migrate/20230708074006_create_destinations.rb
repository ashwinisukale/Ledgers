class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :type
      t.integer :destination_id
      t.string :description
      t.references equity_transaction, foreign_key: true

      t.timestamps
    end
  end
end
