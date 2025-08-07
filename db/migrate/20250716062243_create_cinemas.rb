class CreateCinemas < ActiveRecord::Migration[8.0]
  def change
    create_table :cinemas do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :cnpj, null: false
      t.references :city, null: false, foreign_key: true
      t.text :description
      t.string :phone, null: false
      t.string :email, null: false
      t.string :logo

      t.timestamps
    end
  end
end
