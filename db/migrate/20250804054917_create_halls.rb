class CreateHalls < ActiveRecord::Migration[8.0]
  def change
    create_table :halls do |t|
      t.references :cinema, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :total_seats, null: false

      t.timestamps
    end
  end
end
