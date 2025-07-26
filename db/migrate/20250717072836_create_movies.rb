class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string  :title, null: false, limit: 255
      t.text    :description
      t.integer :duration_minutes
      t.string  :genre, limit: 255
      t.string  :director, limit: 255
      t.text    :cast
      t.string  :language, limit: 10
      t.string  :trailer, limit: 255
      t.string  :image, limit: 255
      t.string  :banner, limit: 255
      t.date    :release_date
      t.string  :age_rating, limit: 20
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
