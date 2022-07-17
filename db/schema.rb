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

ActiveRecord::Schema[7.0].define(version: 2022_07_17_184120) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "block_times", force: :cascade do |t|
    t.time "start"
    t.time "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hospital_id", null: false
    t.index ["hospital_id"], name: "index_doctors_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "phone"
    t.datetime "day"
    t.string "rut"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "work_day_id", null: false
    t.bigint "block_time_id", null: false
    t.bigint "doctor_id", null: false
    t.index ["block_time_id"], name: "index_reservations_on_block_time_id"
    t.index ["doctor_id"], name: "index_reservations_on_doctor_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
    t.index ["work_day_id"], name: "index_reservations_on_work_day_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_days", force: :cascade do |t|
    t.string "name"
    t.integer "day_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "working_days", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "work_day_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_working_days_on_doctor_id"
    t.index ["work_day_id"], name: "index_working_days_on_work_day_id"
  end

  create_table "working_hours", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "block_time_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_time_id"], name: "index_working_hours_on_block_time_id"
    t.index ["doctor_id"], name: "index_working_hours_on_doctor_id"
  end

  add_foreign_key "doctors", "hospitals"
  add_foreign_key "reservations", "block_times"
  add_foreign_key "reservations", "doctors"
  add_foreign_key "reservations", "users"
  add_foreign_key "reservations", "work_days"
  add_foreign_key "working_days", "doctors"
  add_foreign_key "working_days", "work_days"
  add_foreign_key "working_hours", "block_times"
  add_foreign_key "working_hours", "doctors"
end
