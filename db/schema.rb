# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160428065238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "cover_img"
    t.string   "address"
    t.string   "phone_number"
    t.string   "website"
    t.text     "description"
    t.decimal  "rating"
    t.decimal  "kcal"
    t.integer  "num_slot"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "start_day"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "customer_courses", force: :cascade do |t|
    t.integer  "studio_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "customer_courses", ["customer_id"], name: "index_customer_courses_on_customer_id", using: :btree
  add_index "customer_courses", ["studio_id"], name: "index_customer_courses_on_studio_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.integer  "point"
    t.decimal  "calo_burnt"
    t.integer  "gender"
    t.date     "birthday"
    t.boolean  "receive_sms"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "exercise_studios", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "exercise_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "exercise_studios", ["course_id"], name: "index_exercise_studios_on_course_id", using: :btree
  add_index "exercise_studios", ["exercise_id"], name: "index_exercise_studios_on_exercise_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "station_studios", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "studio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "station_studios", ["station_id"], name: "index_station_studios_on_station_id", using: :btree
  add_index "station_studios", ["studio_id"], name: "index_station_studios_on_studio_id", using: :btree

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studios", force: :cascade do |t|
    t.string   "cover_img"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "studios", ["user_id"], name: "index_studios_on_user_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "address"
    t.string   "contact_number"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "customer_courses", "customers"
  add_foreign_key "customer_courses", "studios"
  add_foreign_key "customers", "users"
  add_foreign_key "exercise_studios", "courses"
  add_foreign_key "exercise_studios", "exercises"
  add_foreign_key "station_studios", "stations"
  add_foreign_key "station_studios", "studios"
  add_foreign_key "studios", "users"
end
