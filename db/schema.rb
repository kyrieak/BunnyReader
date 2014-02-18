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

ActiveRecord::Schema.define(version: 20140216085739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_options", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bgs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label"
    t.integer  "hue"
    t.integer  "order"
  end

  create_table "feeds", force: true do |t|
    t.integer  "language_id"
    t.string   "url"
    t.string   "name"
    t.string   "item_node_name"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "source_url"
    t.string   "main_source_name"
    t.string   "main_source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "note"
  end

  create_table "tags", force: true do |t|
    t.integer  "feed_id"
    t.string   "name"
    t.string   "node_name"
    t.string   "att_name"
    t.boolean  "get_node_att"
    t.boolean  "get_node_cont"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "pass"
    t.string   "pass_confirm"
    t.integer  "lang_id"
    t.integer  "bg_id"
    t.boolean  "shuffle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
