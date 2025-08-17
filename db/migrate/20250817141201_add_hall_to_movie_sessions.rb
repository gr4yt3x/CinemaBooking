class AddHallToMovieSessions < ActiveRecord::Migration[8.0]
  def change
    add_reference :movie_sessions, :hall, null: false, foreign_key: true
  end
end
