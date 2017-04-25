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

ActiveRecord::Schema.define(version: 0) do

  create_table "advanced_player_stats", force: :cascade do |t|
    t.integer  "player_id",  limit: 4,  null: false
    t.float    "usg",        limit: 24, null: false
    t.float    "ortg",       limit: 24, null: false
    t.float    "drtg",       limit: 24, null: false
    t.float    "ts",         limit: 24, null: false
    t.float    "efg",        limit: 24, null: false
    t.float    "ft",         limit: 24, null: false
    t.float    "tfg",        limit: 24, null: false
    t.float    "orb",        limit: 24, null: false
    t.float    "drb",        limit: 24, null: false
    t.float    "trb",        limit: 24, null: false
    t.float    "ast",        limit: 24, null: false
    t.float    "stl",        limit: 24, null: false
    t.float    "blk",        limit: 24, null: false
    t.float    "turn",       limit: 24, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "advanced_player_stats", ["player_id"], name: "index_advanced_player_stats_on_player_id", using: :btree

  create_table "advanced_team_stats", force: :cascade do |t|
    t.integer  "team_id",    limit: 4,  null: false
    t.float    "em",         limit: 24, null: false
    t.float    "o",          limit: 24, null: false
    t.float    "d",          limit: 24, null: false
    t.float    "t",          limit: 24, null: false
    t.float    "luck",       limit: 24, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "advanced_team_stats", ["team_id"], name: "index_advanced_team_stats_on_team_id", using: :btree

  create_table "coaches", force: :cascade do |t|
    t.integer  "team_id",    limit: 4,   null: false
    t.string   "first_name", limit: 255, null: false
    t.string   "last_name",  limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "coaches", ["team_id"], name: "index_coaches_on_team_id", using: :btree

  create_table "conferences", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "full_players", id: false, force: :cascade do |t|
    t.integer  "id",         limit: 4,   default: 0, null: false
    t.integer  "team_id",    limit: 4,               null: false
    t.string   "first_name", limit: 255,             null: false
    t.string   "last_name",  limit: 255,             null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "year",       limit: 255
    t.string   "position",   limit: 255
    t.float    "height",     limit: 24
    t.float    "weight",     limit: 24
  end

  create_table "pg_player_stats", force: :cascade do |t|
    t.integer  "player_id",  limit: 4,  null: false
    t.float    "fg",         limit: 24, null: false
    t.float    "fga",        limit: 24, null: false
    t.float    "fgp",        limit: 24
    t.float    "tpt",        limit: 24, null: false
    t.float    "tpta",       limit: 24, null: false
    t.float    "tptp",       limit: 24
    t.float    "ft",         limit: 24, null: false
    t.float    "fta",        limit: 24, null: false
    t.float    "ftp",        limit: 24
    t.float    "ast",        limit: 24, null: false
    t.float    "stl",        limit: 24, null: false
    t.float    "pts",        limit: 24, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "pg_player_stats", ["player_id"], name: "index_pg_player_stats_on_player_id", using: :btree

  create_table "pg_team_stats", force: :cascade do |t|
    t.integer  "team_id",    limit: 4,  null: false
    t.float    "fg",         limit: 24, null: false
    t.float    "fga",        limit: 24, null: false
    t.float    "fgp",        limit: 24
    t.float    "tpt",        limit: 24, null: false
    t.float    "tpta",       limit: 24, null: false
    t.float    "tptp",       limit: 24
    t.float    "ft",         limit: 24, null: false
    t.float    "fta",        limit: 24, null: false
    t.float    "ftp",        limit: 24
    t.float    "orb",        limit: 24, null: false
    t.float    "drb",        limit: 24, null: false
    t.float    "ast",        limit: 24, null: false
    t.float    "stl",        limit: 24, null: false
    t.float    "pts",        limit: 24, null: false
    t.float    "ptsa",       limit: 24, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "pg_team_stats", ["team_id"], name: "index_pg_team_stats_on_team_id", using: :btree

  create_table "player_descriptions", force: :cascade do |t|
    t.integer  "player_id",  limit: 4,   null: false
    t.string   "year",       limit: 255, null: false
    t.string   "position",   limit: 255, null: false
    t.float    "height",     limit: 24,  null: false
    t.float    "weight",     limit: 24,  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "player_descriptions", ["player_id"], name: "index_player_descriptions_on_player_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.integer  "team_id",    limit: 4,   null: false
    t.string   "first_name", limit: 255, null: false
    t.string   "last_name",  limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "team_records", force: :cascade do |t|
    t.integer  "team_id",      limit: 4, null: false
    t.integer  "wins_total",   limit: 4, null: false
    t.integer  "losses_total", limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "team_records", ["team_id"], name: "index_team_records_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "conference_id", limit: 4,   null: false
    t.string   "school",        limit: 255, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "teams", ["conference_id"], name: "index_teams_on_conference_id", using: :btree

  create_table "total_player_stats", force: :cascade do |t|
    t.integer  "player_id",  limit: 4,  null: false
    t.integer  "fg",         limit: 4,  null: false
    t.integer  "fga",        limit: 4,  null: false
    t.float    "fgp",        limit: 24
    t.integer  "tpt",        limit: 4,  null: false
    t.integer  "tpta",       limit: 4,  null: false
    t.float    "tptp",       limit: 24
    t.integer  "ft",         limit: 4,  null: false
    t.integer  "fta",        limit: 4,  null: false
    t.float    "ftp",        limit: 24
    t.integer  "orb",        limit: 4,  null: false
    t.integer  "drb",        limit: 4,  null: false
    t.integer  "ast",        limit: 4,  null: false
    t.integer  "stl",        limit: 4,  null: false
    t.integer  "pts",        limit: 4,  null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "total_player_stats", ["player_id"], name: "index_total_player_stats_on_player_id", using: :btree

  create_table "total_team_stats", force: :cascade do |t|
    t.integer  "team_id",    limit: 4,  null: false
    t.integer  "fg",         limit: 4,  null: false
    t.integer  "fga",        limit: 4,  null: false
    t.float    "fgp",        limit: 24
    t.integer  "tpt",        limit: 4,  null: false
    t.integer  "tpta",       limit: 4,  null: false
    t.float    "tptp",       limit: 24
    t.integer  "ft",         limit: 4,  null: false
    t.integer  "fta",        limit: 4,  null: false
    t.float    "ftp",        limit: 24
    t.integer  "orb",        limit: 4,  null: false
    t.integer  "drb",        limit: 4,  null: false
    t.integer  "ast",        limit: 4,  null: false
    t.integer  "stl",        limit: 4,  null: false
    t.integer  "pts",        limit: 4,  null: false
    t.integer  "ptsa",       limit: 4,  null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "total_team_stats", ["team_id"], name: "index_total_team_stats_on_team_id", using: :btree

end
