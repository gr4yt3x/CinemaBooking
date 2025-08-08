class CreateMovieSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :movie_sessions do |t|
      t.references :movie, null: false, foreign_key: true
      # t.references :hall, null: false, foreign_key: true
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :language, limit: 10, null: false
      t.string :subtitles, limit: 10
      t.decimal :price_full, precision: 10, scale: 2, null: false
      t.decimal :price_half, precision: 10, scale: 2, null: false
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
