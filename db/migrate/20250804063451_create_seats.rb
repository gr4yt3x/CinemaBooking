class CreateSeats < ActiveRecord::Migration[8.0]
  def change
    create_table :seats do |t|
      t.references :hall, null: false, foreign_key: true
      t.string :seat_number, null: false
      t.string :row, null: false
      t.string :column, null: false
      t.string :seat_type, default: 'regular'
      t.string :status, default: 'available'

      t.timestamps
    end
  end
end
