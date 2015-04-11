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

ActiveRecord::Schema.define(version: 20150411081846) do

  create_table "movie_purchase_options", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "purchase_option_id"
    t.float    "price"
    t.boolean  "active",             default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "movie_purchase_options", ["movie_id"], name: "index_movie_purchase_options_on_movie_id"
  add_index "movie_purchase_options", ["purchase_option_id"], name: "index_movie_purchase_options_on_purchase_option_id"

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "plot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_options", force: :cascade do |t|
    t.string   "quality"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "movie_purchase_option_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "purchases", ["movie_purchase_option_id"], name: "index_purchases_on_movie_purchase_option_id"
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
