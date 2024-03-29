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

ActiveRecord::Schema.define(version: 20150313030731) do

  create_table "contacts", force: :cascade do |t|
    t.string   "name",           limit: 255,   null: false
    t.string   "title",          limit: 255
    t.string   "phone",          limit: 255,   null: false
    t.string   "email",          limit: 255,   null: false
    t.string   "street_address", limit: 255
    t.string   "city",           limit: 255
    t.string   "state_code",     limit: 255
    t.string   "country_code",   limit: 255
    t.string   "zip",            limit: 255
    t.text     "notes",          limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "denominations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "localities", force: :cascade do |t|
    t.string   "name",                   limit: 255,   null: false
    t.string   "city",                   limit: 255,   null: false
    t.string   "country_code",           limit: 2,     null: false
    t.string   "state_code",             limit: 255,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street_address",         limit: 255,   null: false
    t.string   "zip",                    limit: 255,   null: false
    t.text     "location_notes",         limit: 65535
    t.string   "website_url",            limit: 255
    t.boolean  "volunteer_needed",       limit: 1,     null: false
    t.string   "meeting_data_url",       limit: 255
    t.string   "meeting_schedule",       limit: 255
    t.boolean  "invocations_conducted",  limit: 1,     null: false
    t.integer  "contact_id",             limit: 4
    t.string   "phone_number",           limit: 255
    t.string   "contact_name",           limit: 255
    t.string   "contact_title",          limit: 255
    t.string   "contact_phone",          limit: 255
    t.string   "contact_email",          limit: 255
    t.string   "contact_street_address", limit: 255
    t.string   "contact_city",           limit: 255
    t.string   "contact_country_code",   limit: 255
    t.string   "contact_state_code",     limit: 255
    t.string   "contact_zip",            limit: 255
    t.text     "contact_notes",          limit: 65535
    t.string   "slug",                   limit: 255,   null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "religions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "honorific",       limit: 255
    t.integer  "organization_id", limit: 4
    t.integer  "religion_id",     limit: 4
    t.integer  "denomination_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_meetings", force: :cascade do |t|
    t.datetime "meeting_time",                               null: false
    t.string   "invocation_conducted",         limit: 255,   null: false
    t.string   "pledge_before",                limit: 255
    t.string   "asked_to_stand",               limit: 255
    t.text     "speaker_preached",             limit: 65535
    t.text     "speaker_praised",              limit: 65535
    t.text     "concerns",                     limit: 65535
    t.binary   "attachment",                   limit: 65535
    t.integer  "user_id",                      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "locality_id",                  limit: 4
    t.string   "meeting_type",                 limit: 255,   null: false
    t.string   "meeting_url",                  limit: 255
    t.string   "street_address",               limit: 255
    t.integer  "speaker_id",                   limit: 4
    t.string   "minutes_url",                  limit: 255
    t.string   "agenda_url",                   limit: 255
    t.string   "media_url",                    limit: 255
    t.text     "speaker_preached_explanation", limit: 65535
    t.text     "speaker_praised_explanation",  limit: 65535
    t.string   "aasm_state",                   limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "role",                   limit: 4
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "phone_number",           limit: 255,                 null: false
    t.integer  "locality_id",            limit: 4
    t.boolean  "approved",               limit: 1,   default: false, null: false
    t.integer  "roles_mask",             limit: 4
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255,   null: false
    t.integer  "item_id",    limit: 4,     null: false
    t.string   "event",      limit: 255,   null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object",     limit: 65535
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
