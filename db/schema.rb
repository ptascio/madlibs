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

ActiveRecord::Schema.define(version: 20170529171822) do

  create_table "books", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "madlibs", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "story",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "misswords"
    t.integer  "book_id"
    t.index ["book_id"], name: "index_madlibs_on_book_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "session_token",   null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "verbs", force: :cascade do |t|
    t.string   "verb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wordforms", force: :cascade do |t|
    t.text     "words"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "madlib_id"
    t.string   "misswords"
    t.integer  "count"
    t.index ["madlib_id"], name: "index_wordforms_on_madlib_id"
  end

end
