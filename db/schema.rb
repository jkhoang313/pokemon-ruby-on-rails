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

ActiveRecord::Schema.define(version: 20170118141408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokedex_types", force: :cascade do |t|
    t.integer  "type_id"
    t.integer  "pokedex_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokedexes", force: :cascade do |t|
    t.string   "name"
    t.integer  "level",           default: 1
    t.string   "hp"
    t.string   "attack"
    t.string   "defense"
    t.string   "special_attack"
    t.string   "special_defense"
    t.string   "speed"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer  "trainer_id"
    t.integer  "pokedex_id"
    t.string   "name"
    t.integer  "level",           default: 1
    t.integer  "experience"
    t.string   "hp"
    t.string   "attack"
    t.string   "defense"
    t.string   "special_attack"
    t.string   "special_defense"
    t.string   "speed"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "age"
    t.string   "gender"
    t.string   "starter_pokemon"
    t.integer  "poke_tokens",     default: 5
    t.integer  "last_token"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
