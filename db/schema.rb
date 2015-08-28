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

ActiveRecord::Schema.define(version: 20150514232942) do

  create_table "byes", force: :cascade do |t|
    t.integer  "week_id",    limit: 4
    t.integer  "team_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "byes", ["team_id"], name: "index_byes_on_team_id", using: :btree
  add_index "byes", ["week_id"], name: "index_byes_on_week_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "home_team_id", limit: 4
    t.integer  "away_team_id", limit: 4
    t.string   "spread",       limit: 255
    t.integer  "week_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["week_id"], name: "index_games_on_week_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "picks", force: :cascade do |t|
    t.integer  "winning_team_id",     limit: 4
    t.integer  "losing_team_id",      limit: 4
    t.integer  "winning_score",       limit: 4
    t.integer  "losing_score",        limit: 4
    t.string   "current_spread",      limit: 255
    t.integer  "game_id",             limit: 4
    t.integer  "user_id",             limit: 4
    t.integer  "made_before_week_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",              limit: 255
    t.integer  "pickset_id",          limit: 4
  end

  add_index "picks", ["game_id"], name: "index_picks_on_game_id", using: :btree
  add_index "picks", ["pickset_id"], name: "index_picks_on_pickset_id", using: :btree
  add_index "picks", ["user_id"], name: "index_picks_on_user_id", using: :btree

  create_table "picksets", force: :cascade do |t|
    t.integer "season_id", limit: 4
    t.integer "user_id",   limit: 4
    t.string  "name",      limit: 255
  end

  add_index "picksets", ["season_id"], name: "index_picksets_on_season_id", using: :btree
  add_index "picksets", ["user_id"], name: "index_picksets_on_user_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.integer  "year",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "city",       limit: 255
    t.string   "name",       limit: 255
    t.string   "abbr",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "conference", limit: 255
    t.string   "division",   limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "role",                   limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree

  create_table "weeks", force: :cascade do |t|
    t.integer  "number",     limit: 4
    t.integer  "season_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weeks", ["season_id"], name: "index_weeks_on_season_id", using: :btree

end
