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

ActiveRecord::Schema.define(version: 20160531041405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branches", force: :cascade do |t|
    t.integer  "studio_id"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "studio_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "cover_img"
    t.string   "phone_number"
    t.string   "website"
    t.text     "description"
    t.decimal  "rating"
    t.decimal  "kcal"
    t.integer  "num_slot"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "start_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "teacher_id"
    t.integer  "station_id"
    t.integer  "studio_id"
    t.integer  "exercise_id"
    t.integer  "enrollments_count", default: 0
    t.integer  "status",            default: 0
    t.integer  "tuition"
    t.string   "currency"
    t.integer  "booked_slot"
    t.integer  "days_of_week",      default: [],              array: true
    t.date     "full_dates",        default: [],              array: true
  end

  add_index "courses", ["days_of_week"], name: "index_courses_on_days_of_week", using: :gin
  add_index "courses", ["full_dates"], name: "index_courses_on_full_dates", using: :gin

  create_table "customers", force: :cascade do |t|
    t.integer  "point"
    t.integer  "gender"
    t.date     "birthday"
    t.boolean  "receive_sms"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "card_token"
    t.integer  "total_point", default: 0
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "course_id"
    t.integer  "status"
    t.date     "join_date"
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree
  add_index "enrollments", ["customer_id"], name: "index_enrollments_on_customer_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "favourite_courses", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "services", force: :cascade do |t|
    t.integer  "studio_id"
    t.integer  "exercise_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "latitude",     default: 0.0
    t.float    "longitude",    default: 0.0
    t.integer  "status"
    t.integer  "requester_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string   "cover_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer  "role_id"
    t.string   "role_type"
    t.string   "provider"
    t.string   "uid"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "enrollments", "customers"
end
