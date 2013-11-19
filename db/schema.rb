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

ActiveRecord::Schema.define(version: 20131115202046) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horses", force: true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "riders", force: true do |t|
    t.string   "name"
    t.boolean  "fav"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runs", force: true do |t|
    t.integer  "show_id"
    t.integer  "rider_id"
    t.integer  "horse_id"
    t.decimal  "time"
    t.integer  "placing"
    t.string   "penalty"
    t.boolean  "fav"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "show_class_id"
  end

  create_table "searches", force: true do |t|
    t.integer  "user_id"
    t.string   "query"
    t.datetime "searched_on"
  end

  create_table "show_classes", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_classes", ["category_id"], name: "index_show_classes_on_category_id"

  create_table "shows", force: true do |t|
    t.date     "date"
    t.boolean  "double_judged"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.boolean  "is_admin"
    t.boolean  "is_mod"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "video_views", force: true do |t|
    t.integer  "video_id"
    t.integer  "user_id"
    t.datetime "viewed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.integer  "run_id"
    t.string   "uuid"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_mp4"
    t.boolean  "has_webm"
    t.string   "original_name"
    t.string   "source"
  end

end
