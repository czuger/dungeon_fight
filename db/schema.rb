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

ActiveRecord::Schema.define(version: 20160827172326) do

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
    t.integer  "d_dungeoneer_id",                 null: false
    t.integer  "s_skill_id",                      null: false
    t.boolean  "active",          default: false, null: false
    t.datetime "active_since",                    null: false
    t.integer  "level",           default: 1,     null: false
    t.integer  "skills_points",   default: 0,     null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["d_dungeoneer_id"], name: "index_d_dungeoneer_skills_on_d_dungeoneer_id"
    t.index ["s_skill_id"], name: "index_d_dungeoneer_skills_on_s_skill_id"
  end

  create_table "d_dungeoneers", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "desc"
    t.integer  "fo",         null: false
    t.integer  "coo",        null: false
    t.integer  "mem",        null: false
    t.integer  "vol",        null: false
    t.integer  "c_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_class_id"], name: "index_d_dungeoneers_on_c_class_id"
  end

  create_table "i_items", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "difficulty",    default: 0
    t.integer  "attack_dice"
    t.integer  "c_class_id_id"
    t.integer  "min_level",     default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["c_class_id_id"], name: "index_i_items_on_c_class_id_id"
  end

  create_table "s_skills", force: :cascade do |t|
    t.string   "name",                   null: false
    t.string   "desc"
    t.integer  "difficulty", default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
