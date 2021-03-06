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

ActiveRecord::Schema.define(version: 20150413143208) do

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.boolean  "read",       limit: 1,   default: false
    t.string   "content",    limit: 255
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "deadline"
    t.string   "location",   limit: 255
    t.string   "phone",      limit: 255
    t.string   "status",     limit: 255
    t.string   "server",     limit: 255
    t.decimal  "total",                    precision: 8, scale: 2
    t.text     "process",    limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "stars",      limit: 4
  end

  add_index "orders", ["deadline"], name: "index_orders_on_deadline", using: :btree
  add_index "orders", ["location"], name: "index_orders_on_location", using: :btree
  add_index "orders", ["phone"], name: "index_orders_on_phone", using: :btree
  add_index "orders", ["server"], name: "index_orders_on_server", using: :btree
  add_index "orders", ["status"], name: "index_orders_on_status", using: :btree
  add_index "orders", ["title"], name: "index_orders_on_title", using: :btree
  add_index "orders", ["total"], name: "index_orders_on_total", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.decimal  "balance",                            precision: 8, scale: 2, default: 0.0
    t.string   "phone",                  limit: 255
    t.integer  "current_orders",         limit: 4,                           default: 0
    t.integer  "score",                  limit: 4,                           default: 0
    t.integer  "quantity",               limit: 4,                           default: 0
    t.integer  "wrong_count",            limit: 4,                           default: 0
    t.integer  "terminated_count",       limit: 4,                           default: 0
    t.string   "name",                   limit: 255
    t.string   "email",                  limit: 255,                         default: "",  null: false
    t.string   "encrypted_password",     limit: 255,                         default: "",  null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,                           default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
