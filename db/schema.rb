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

ActiveRecord::Schema[7.0].define(version: 2024_09_21_060659) do
  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "expens", charset: "utf8mb4", force: :cascade do |t|
    t.integer "taxes", null: false
    t.decimal "lone_interest_rate", precision: 5, scale: 2
    t.integer "management_fee"
    t.integer "brokerage"
    t.integer "advertising"
    t.integer "premium"
    t.integer "depreciation"
    t.integer "repair_cost"
    t.integer "other_expenses"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_expens_on_property_id"
  end

  create_table "expenses", charset: "utf8mb4", force: :cascade do |t|
    t.integer "taxes", null: false
    t.decimal "lone_interest_rate", precision: 5, scale: 2
    t.integer "management_fee"
    t.integer "brokerage"
    t.integer "advertising"
    t.integer "premium"
    t.integer "depreciation"
    t.integer "repair_cost"
    t.integer "other_expenses"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_expenses_on_property_id"
  end

  create_table "incomes", charset: "utf8mb4", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "rent"
    t.integer "key_money"
    t.integer "other_income"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_incomes_on_property_id"
  end

  create_table "properties", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "postal_code", null: false
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.string "street_number", null: false
    t.string "room_number"
    t.integer "building_type_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "user_name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "expens", "properties"
  add_foreign_key "expenses", "properties"
  add_foreign_key "properties", "users"
end
