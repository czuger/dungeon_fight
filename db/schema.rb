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

ActiveRecord::Schema.define(version: 20160831134010) do

  create_table "c_classes", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "c_classes_s_skills", id: false, force: :cascade do |t|
    t.integer "c_class_id", null: false
    t.integer "s_skill_id", null: false
    t.index ["c_class_id"], name: "index_c_classes_s_skills_on_c_class_id"
    t.index ["s_skill_id"], name: "index_c_classes_s_skills_on_s_skill_id"
  end

  create_table "d_dungeoneer_skills", force: :cascade do |t|
    t.integer  "d_dungeoneer_id",             null: false
    t.integer  "s_skill_id",                  null: false
    t.integer  "skills_points",   default: 0, null: false
    t.integer  "level",           default: 1, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["d_dungeoneer_id"], name: "index_d_dungeoneer_skills_on_d_dungeoneer_id"
    t.index ["s_skill_id"], name: "index_d_dungeoneer_skills_on_s_skill_id"
  end

  create_table "d_dungeoneers", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "desc"
    t.integer  "fo",             null: false
    t.integer  "coo",            null: false
    t.integer  "mem",            null: false
    t.integer  "vol",            null: false
    t.integer  "c_class_id",     null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "attack_item_id"
    t.index ["attack_item_id"], name: "index_d_dungeoneers_on_attack_item_id"
    t.index ["c_class_id"], name: "index_d_dungeoneers_on_c_class_id"
  end

  create_table "d_dungeoneers_f_fights", id: false, force: :cascade do |t|
    t.integer "d_dungeoneer_id", null: false
    t.integer "f_fight_id",      null: false
    t.index ["f_fight_id", "d_dungeoneer_id"], name: "index_d_dungeoneers_f_fights_on_f_fight_id_and_d_dungeoneer_id"
  end

  create_table "f_fight_results", force: :cascade do |t|
    t.integer  "f_fight_id"
    t.string   "attacker_type"
    t.integer  "attacker_id"
    t.string   "defender_type"
    t.integer  "defender_id"
    t.integer  "round"
    t.integer  "roll"
    t.integer  "roll_with_bonus"
    t.integer  "to_hit"
    t.boolean  "success"
    t.integer  "skills_points_earned"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["attacker_type", "attacker_id"], name: "index_f_fight_results_on_attacker_type_and_attacker_id"
    t.index ["defender_type", "defender_id"], name: "index_f_fight_results_on_defender_type_and_defender_id"
    t.index ["f_fight_id"], name: "index_f_fight_results_on_f_fight_id"
  end

  create_table "f_fights", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "f_fights_m_monsters", id: false, force: :cascade do |t|
    t.integer "f_fight_id",   null: false
    t.integer "m_monster_id", null: false
    t.index ["f_fight_id", "m_monster_id"], name: "index_f_fights_m_monsters_on_f_fight_id_and_m_monster_id"
  end

  create_table "i_items", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "difficulty",  default: 0
    t.integer  "attack_dice"
    t.integer  "min_level",   default: 0
    t.integer  "s_skill_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["s_skill_id"], name: "index_i_items_on_s_skill_id"
  end

  create_table "m_monsters", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "desc"
    t.integer  "attack_level"
    t.integer  "attack_item_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["attack_item_id"], name: "index_m_monsters_on_attack_item_id"
  end

  create_table "s_skills", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "desc"
    t.integer  "difficulty",       default: 1, null: false
    t.string   "first_attribute",              null: false
    t.string   "second_attribute",             null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
