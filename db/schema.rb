# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_04_054917) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cinemas", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "cnpj", null: false
    t.bigint "city_id", null: false
    t.text "description"
    t.string "phone", null: false
    t.string "email", null: false
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_cinemas_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "state", limit: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "halls", force: :cascade do |t|
    t.bigint "cinema_id", null: false
    t.string "name", null: false
    t.integer "total_seats", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_halls_on_cinema_id"
  end

  add_foreign_key "cinemas", "cities"
  add_foreign_key "halls", "cinemas"
end
