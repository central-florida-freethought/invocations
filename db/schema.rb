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

ActiveRecord::Schema.define(version: 20140916040851) do

  create_table "contacts", force: true do |t|
    t.string   "name",           null: false
    t.string   "title"
    t.string   "phone",          null: false
    t.string   "email",          null: false
    t.string   "street_address"
    t.string   "city"
    t.string   "state_code"
    t.string   "country_code"
    t.string   "zip"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "denominations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "localities", force: true do |t|
    t.string   "name",                             null: false
    t.string   "city",                             null: false
    t.string   "country_code",           limit: 2, null: false
    t.string   "state_code",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street_address",                   null: false
    t.string   "zip",                              null: false
    t.text     "location_notes"
    t.string   "website_url"
    t.boolean  "volunteer_needed",                 null: false
    t.string   "meeting_data_url"
    t.string   "meeting_schedule"
    t.boolean  "invocations_conducted",            null: false
    t.integer  "contact_id"
    t.string   "phone_number"
    t.string   "contact_name"
    t.string   "contact_title"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "contact_street_address"
    t.string   "contact_city"
    t.string   "contact_country_code"
    t.string   "contact_state_code"
    t.string   "contact_zip"
    t.text     "contact_notes"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "religions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers", force: true do |t|
    t.string   "name"
    t.string   "honorific"
    t.integer  "organization_id"
    t.integer  "religion_id"
    t.integer  "denomination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_meetings", force: true do |t|
    t.datetime "meeting_time",                 null: false
    t.string   "invocation_conducted",         null: false
    t.string   "pledge_before"
    t.string   "asked_to_stand"
    t.text     "speaker_preached"
    t.text     "speaker_praised"
    t.text     "concerns"
    t.binary   "attachment"
    t.boolean  "pending"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "locality_id"
    t.string   "meeting_type",                 null: false
    t.string   "meeting_url"
    t.string   "street_address"
    t.integer  "speaker_id"
    t.string   "minutes_url"
    t.string   "agenda_url"
    t.string   "media_url"
    t.text     "speaker_preached_explanation"
    t.text     "speaker_praised_explanation"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
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
    t.integer  "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number",                           null: false
    t.integer  "locality_id"
    t.boolean  "approved",               default: false, null: false
    t.integer  "roles_mask"
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
