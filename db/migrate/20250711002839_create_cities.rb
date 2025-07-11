class CreateCities < ActiveRecord::Migration[8.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :state, limit: 2, null: false

      t.timestamps
    end
  end
end
