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

ActiveRecord::Schema.define(version: 20160223010009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artapps", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "hyperlink"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "date"
    t.string   "publisher"
    t.string   "headline"
    t.string   "image_url"
    t.string   "link_text"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "country"
    t.string   "comment"
    t.boolean  "display_sig"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "occupation"
    t.boolean  "feature"
    t.boolean  "subscribe"
  end

  create_table "statements", force: :cascade do |t|
    t.string   "name"
    t.text     "statement"
    t.string   "hyperlink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "feature"
  end

end
