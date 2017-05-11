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

ActiveRecord::Schema.define(version: 20170511120448) do

  create_table "madlibs", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "story",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "misswords"
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
    t.index ["madlib_id"], name: "index_wordforms_on_madlib_id"
  end

end
