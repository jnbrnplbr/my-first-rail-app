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

ActiveRecord::Schema[7.1].define(version: 2024_01_21_151255) do
  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funds", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.float "amount"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_funds_on_created_by"
  end

  create_table "histories", force: :cascade do |t|
    t.string "action"
    t.string "module"
    t.string "description"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "serial_number"
    t.string "model"
    t.integer "quantity"
    t.integer "unit_id"
    t.integer "category_id"
    t.integer "brand_id"
    t.integer "project_id"
    t.integer "allocated_to"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_inventories_on_brand_id"
    t.index ["category_id"], name: "index_inventories_on_category_id"
    t.index ["project_id"], name: "index_inventories_on_project_id"
    t.index ["unit_id"], name: "index_inventories_on_unit_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "description"
    t.float "bid_amount"
    t.float "purchase_request_amount"
    t.integer "fund_id"
    t.integer "supplier_id", null: false
    t.string "specification", default: ""
    t.string "solicitation_number", null: false
    t.string "notice_of_award", default: ""
    t.string "notice_to_proceed", default: ""
    t.string "purchase_order", default: ""
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fund_id"], name: "index_projects_on_fund_id"
    t.index ["supplier_id"], name: "index_projects_on_supplier_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "menu_actions", default: ""
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "point_person", null: false
    t.string "contact_number", null: false
    t.integer "created_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_suppliers_on_created_by"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.integer "role_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "projects", "funds"
end
