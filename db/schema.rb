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

ActiveRecord::Schema.define(version: 2019_07_26_090845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pocket_monster_types", force: :cascade do |t|
    t.bigint "pocket_monster_id"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pocket_monster_id"], name: "index_pocket_monster_types_on_pocket_monster_id"
    t.index ["type_id"], name: "index_pocket_monster_types_on_type_id"
  end

  create_table "pocket_monsters", force: :cascade do |t|
    t.integer "pokedex_number"
    t.string "pokemon_name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poket_monster_types", force: :cascade do |t|
    t.bigint "pocket_monster_id"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pocket_monster_id"], name: "index_poket_monster_types_on_pocket_monster_id"
    t.index ["type_id"], name: "index_poket_monster_types_on_type_id"
  end

  create_table "posession_monsters", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pocket_monster_id"
    t.integer "posession_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pocket_monster_id"], name: "index_posession_monsters_on_pocket_monster_id"
    t.index ["user_id"], name: "index_posession_monsters_on_user_id"
  end

  create_table "shiny_posession_monsters", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pocket_monster_id"
    t.integer "posession_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pocket_monster_id"], name: "index_shiny_posession_monsters_on_pocket_monster_id"
    t.index ["user_id"], name: "index_shiny_posession_monsters_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_configs", force: :cascade do |t|
    t.integer "sort_key", default: 0, null: false
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "pocket_monster_types", "pocket_monsters"
  add_foreign_key "pocket_monster_types", "types"
  add_foreign_key "poket_monster_types", "pocket_monsters"
  add_foreign_key "poket_monster_types", "types"
  add_foreign_key "posession_monsters", "pocket_monsters"
  add_foreign_key "posession_monsters", "users"
  add_foreign_key "shiny_posession_monsters", "pocket_monsters"
  add_foreign_key "shiny_posession_monsters", "users"
end
