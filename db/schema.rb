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

ActiveRecord::Schema.define(version: 20161207174049) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "description"
    t.integer  "hackimoto_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["hackimoto_id"], name: "index_categories_on_hackimoto_id"

  create_table "hack_users", force: :cascade do |t|
    t.integer  "hack_id"
    t.integer  "user_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hackimoto_id"
  end

  add_index "hack_users", ["hack_id"], name: "index_hack_users_on_hack_id"
  add_index "hack_users", ["user_id"], name: "index_hack_users_on_user_id"

  create_table "hackimoto_admin_users", force: :cascade do |t|
    t.integer  "hackimoto_id", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hackimoto_admin_users", ["hackimoto_id"], name: "index_hackimoto_admin_users_on_hackimoto_id"
  add_index "hackimoto_admin_users", ["user_id"], name: "index_hackimoto_admin_users_on_user_id"

  create_table "hackimotos", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.date     "start_date",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "rule"
  end

  create_table "hacks", force: :cascade do |t|
    t.string   "name",                             null: false
    t.string   "description"
    t.integer  "hackimoto_id",                     null: false
    t.integer  "proposed_user_id",                 null: false
    t.boolean  "is_hack",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hacks", ["hackimoto_id"], name: "index_hacks_on_hackimoto_id"

  create_table "judges", force: :cascade do |t|
    t.integer  "hackimoto_id", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "judges", ["hackimoto_id"], name: "index_judges_on_hackimoto_id"
  add_index "judges", ["user_id"], name: "index_judges_on_user_id"

  create_table "prizes", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.integer  "amount",      null: false
    t.integer  "rank",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prizes", ["category_id"], name: "index_prizes_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",            null: false
    t.string   "oauth_token"
    t.string   "profile_pic"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["oauth_token"], name: "index_users_on_oauth_token"

  create_table "winners", force: :cascade do |t|
    t.integer  "hackimoto_id"
    t.integer  "prize_id"
    t.integer  "hack_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "winners", ["hack_id"], name: "index_winners_on_hack_id"
  add_index "winners", ["hackimoto_id"], name: "index_winners_on_hackimoto_id"
  add_index "winners", ["prize_id"], name: "index_winners_on_prize_id"

end
