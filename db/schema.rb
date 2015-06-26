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

ActiveRecord::Schema.define(version: 20150331134822) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_code"
    t.string   "business_field"
    t.string   "business_type"
    t.string   "job_title"
    t.string   "telephone"
    t.string   "fax"
    t.string   "company_name"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true

  create_table "information", force: true do |t|
    t.text     "about"
    t.string   "company_skype"
    t.string   "address"
    t.string   "telephone"
    t.string   "fax"
    t.string   "mail_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "JumbotronTitle"
    t.text     "JumbotronSubtitle"
    t.string   "JumbotronImg"
    t.string   "html_bg"
  end

  create_table "inquirylists", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "inquirylist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.text     "tags"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
    t.string   "model_name"
    t.string   "item_number"
    t.string   "part_number"
    t.string   "diameter"
    t.string   "size"
    t.integer  "subcategory_id"
  end

  create_table "subcategories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
