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

ActiveRecord::Schema.define(version: 20150410130143) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "order_display"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style_icon"
  end

  create_table "category_translations", force: true do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id"
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale"

  create_table "experience_translations", force: true do |t|
    t.integer  "experience_id",     null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "place"
    t.string   "country"
    t.string   "company"
    t.text     "description"
    t.text     "short_description"
  end

  add_index "experience_translations", ["experience_id"], name: "index_experience_translations_on_experience_id"
  add_index "experience_translations", ["locale"], name: "index_experience_translations_on_locale"

  create_table "experiences", force: true do |t|
    t.string   "title"
    t.string   "place"
    t.string   "country"
    t.string   "company"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.date     "begin_date"
    t.date     "end_date"
    t.text     "description"
    t.text     "short_description"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["type_id"], name: "index_experiences_on_type_id"

  create_table "experiences_skills", id: false, force: true do |t|
    t.integer "experience_id"
    t.integer "skill_id"
  end

  create_table "project_translations", force: true do |t|
    t.integer  "project_id",        null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.text     "short_description"
  end

  add_index "project_translations", ["locale"], name: "index_project_translations_on_locale"
  add_index "project_translations", ["project_id"], name: "index_project_translations_on_project_id"

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.text     "short_description"
    t.integer  "order_display"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["experience_id"], name: "index_projects_on_experience_id"

  create_table "skill_translations", force: true do |t|
    t.integer  "skill_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "skill_translations", ["locale"], name: "index_skill_translations_on_locale"
  add_index "skill_translations", ["skill_id"], name: "index_skill_translations_on_skill_id"

  create_table "skills", force: true do |t|
    t.string   "name"
    t.integer  "power"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["category_id"], name: "index_skills_on_category_id"

  create_table "type_translations", force: true do |t|
    t.integer  "type_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "type_translations", ["locale"], name: "index_type_translations_on_locale"
  add_index "type_translations", ["type_id"], name: "index_type_translations_on_type_id"

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style_icon"
    t.string   "style_color"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
