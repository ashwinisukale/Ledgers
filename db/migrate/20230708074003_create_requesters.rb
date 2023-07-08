class CreateRequesters < ActiveRecord::Migration[5.2]
  def change
    create_table :requesters do |t|
      t.string :type
      t.references :transaction, foreign_key: true

      t.timestamps
    end
  end
end
