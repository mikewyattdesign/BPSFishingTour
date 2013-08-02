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

ActiveRecord::Schema.define(version: 20130731214622) do

  create_table "divisions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divisions_events", force: true do |t|
    t.integer  "event_id"
    t.integer  "division_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "province"
    t.string   "state"
    t.string   "country"
    t.string   "postal_code"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_teams", force: true do |t|
    t.integer  "event_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "suite"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "ext"
    t.string   "shirt"
    t.string   "outdoor_rewards_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_preference"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.text     "status"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "requests", force: true do |t|
    t.integer  "requester"
    t.string   "invitee_email"
    t.integer  "invitee_id"
    t.boolean  "accepted",      default: false
    t.boolean  "denied",        default: false
    t.datetime "replied_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "event_id"
    t.integer  "position"
    t.string   "angler"
    t.string   "angler_rewards"
    t.string   "co_angler"
    t.string   "co_angler_rewards"
    t.decimal  "weight"
    t.decimal  "bf"
    t.decimal  "hp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "angler_id"
    t.integer  "co_angler_id"
    t.integer  "team_id"
  end

  add_index "scores", ["team_id"], name: "index_scores_on_team_id"

  create_table "teams", force: true do |t|
    t.string   "team_picture_file_name"
    t.string   "team_picture_content_type"
    t.integer  "team_picture_file_size"
    t.datetime "team_picture_updated_at"
    t.text     "boat_description"
    t.text     "favorite_gear"
  end

  create_table "teams_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "team_id", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
