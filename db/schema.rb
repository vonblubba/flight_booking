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

ActiveRecord::Schema[7.0].define(version: 2021_05_18_110700) do
  create_table "airplanes", force: :cascade do |t|
    t.string "airplane_code", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airplane_code"], name: "index_airplanes_on_airplane_code"
  end

  create_table "flight_executions", force: :cascade do |t|
    t.string "flight_execution_code", null: false
    t.integer "flight_id", null: false
    t.integer "airplane_id", null: false
    t.datetime "flight_execution_time", precision: nil, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airplane_id"], name: "index_flight_executions_on_airplane_id"
    t.index ["flight_execution_code"], name: "index_flight_executions_on_flight_execution_code"
    t.index ["flight_execution_time"], name: "index_flight_executions_on_flight_execution_time"
    t.index ["flight_id"], name: "index_flight_executions_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "from_city_code", null: false
    t.string "to_city_code", null: false
    t.string "flight_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_code"], name: "index_flights_on_flight_code"
    t.index ["from_city_code", "to_city_code"], name: "index_flights_on_from_city_code_and_to_city_code", unique: true
    t.index ["from_city_code"], name: "index_flights_on_from_city_code"
    t.index ["to_city_code"], name: "index_flights_on_to_city_code"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "identification_document_code", null: false
    t.integer "flight_execution_id", null: false
    t.integer "user_id", null: false
    t.string "seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_passengers_on_first_name"
    t.index ["flight_execution_id"], name: "index_passengers_on_flight_execution_id"
    t.index ["last_name"], name: "index_passengers_on_last_name"
    t.index ["user_id"], name: "index_passengers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
