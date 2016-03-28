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

ActiveRecord::Schema.define(version: 20160328213222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lyrics_words", force: :cascade do |t|
    t.string   "value"
    t.integer  "syllables"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "body"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "pattern"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bass_pattern"
  end

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rhythm1"
    t.string   "rhythm2"
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer "post_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "value"
    t.integer  "syllables"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section_id"
  end

end
