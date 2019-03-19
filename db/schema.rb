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

ActiveRecord::Schema.define(version: 20190319063146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expertises", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "card_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payment_methods_on_user_id"
  end

  create_table "registration_requests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "phone"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "comment"
    t.bigint "service_response_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "investigated"
    t.index ["service_response_id"], name: "index_reviews_on_service_response_id"
  end

  create_table "service_providers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "expertise_id"
    t.string "first_name"
    t.string "last_name"
    t.string "status"
    t.integer "phone"
    t.index ["email"], name: "index_service_providers_on_email", unique: true
    t.index ["expertise_id"], name: "index_service_providers_on_expertise_id"
    t.index ["reset_password_token"], name: "index_service_providers_on_reset_password_token", unique: true
  end

  create_table "service_requests", force: :cascade do |t|
    t.string "location"
    t.string "description"
    t.integer "time_to_answer"
    t.integer "price"
    t.boolean "answered"
    t.boolean "completed"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "expertise_id"
    t.boolean "online_payment"
    t.boolean "paid"
    t.index ["expertise_id"], name: "index_service_requests_on_expertise_id"
    t.index ["user_id"], name: "index_service_requests_on_user_id"
  end

  create_table "service_responses", force: :cascade do |t|
    t.bigint "service_request_id"
    t.bigint "service_provider_id"
    t.boolean "accepted"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "paid"
    t.index ["service_provider_id"], name: "index_service_responses_on_service_provider_id"
    t.index ["service_request_id"], name: "index_service_responses_on_service_request_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "payment_methods", "users"
  add_foreign_key "reviews", "service_responses"
  add_foreign_key "service_providers", "expertises"
  add_foreign_key "service_requests", "expertises"
  add_foreign_key "service_requests", "users"
  add_foreign_key "service_responses", "service_providers"
  add_foreign_key "service_responses", "service_requests"
end
