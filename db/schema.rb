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

ActiveRecord::Schema.define(version: 20160803051929) do

  create_table "block_users", force: :cascade do |t|
    t.string   "user_id",         limit: 255
    t.string   "blocked_user_id", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "room_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id",    limit: 255
    t.string   "message",    limit: 255
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "send_user_id",     limit: 255
    t.string   "opponent_user_id", limit: 255
  end

  create_table "user_rooms", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "room_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",     limit: 255
    t.string   "status",      limit: 255
    t.string   "location",    limit: 255
    t.integer  "age",         limit: 4
    t.string   "gender",      limit: 255
    t.string   "facebook_id", limit: 255
    t.string   "latitude",    limit: 255
    t.string   "longitude",   limit: 255
    t.string   "login_time",  limit: 255
    t.text     "greeting",    limit: 65535
    t.string   "work",        limit: 255,   default: ""
    t.string   "school",      limit: 255,   default: ""
  end

end
