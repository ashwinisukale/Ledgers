class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :type
      t.integer :source_id
      t.string :description
      t.references :transaction, foreign_key: true

      t.timestamps
    end
  end
end
