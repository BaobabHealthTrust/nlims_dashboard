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

ActiveRecord::Schema.define(version: 20180619070731) do

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "measure_ranges", force: :cascade do |t|
    t.integer  "measures_id",    limit: 8
    t.integer  "age_min",        limit: 4
    t.integer  "age_max",        limit: 4
    t.integer  "gender",         limit: 4
    t.decimal  "range_lower",                precision: 10
    t.decimal  "range_upper",                precision: 10
    t.string   "alphanumeric",   limit: 255
    t.string   "interpretation", limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "measure_ranges", ["measures_id"], name: "index_measure_ranges_on_measures_id", using: :btree

  create_table "measure_types", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "doc_id",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "measures", force: :cascade do |t|
    t.string   "name",            limit: 255, null: false
    t.string   "doc_id",          limit: 255
    t.string   "unit",            limit: 255
    t.integer  "measure_type_id", limit: 8
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "measures", ["measure_type_id"], name: "index_measures_on_measure_type_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "specimen_type_id",             limit: 8,   null: false
    t.integer  "patient_id",                   limit: 8,   null: false
    t.integer  "specimen_status_id",           limit: 8,   null: false
    t.integer  "ward_id",                      limit: 8,   null: false
    t.datetime "date_created"
    t.string   "priority",                     limit: 255, null: false
    t.string   "sample_drawn_by_id",           limit: 255
    t.string   "sample_drawn_by_name",         limit: 255
    t.string   "sample_drawn_by_phone_number", limit: 255
    t.string   "target_lab",                   limit: 255, null: false
    t.datetime "art_start_date"
    t.string   "health_facility",              limit: 255, null: false
    t.string   "requested_by",                 limit: 255, null: false
    t.datetime "date_sample_drawn"
    t.string   "health_facility_district",     limit: 255
    t.string   "dispatcher_id",                limit: 255
    t.string   "dispatcher_name",              limit: 255
    t.string   "dispatcher_phone_number",      limit: 255
    t.datetime "date_dispatched"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "orders", ["patient_id"], name: "index_orders_on_patient_id", using: :btree
  add_index "orders", ["specimen_status_id"], name: "index_orders_on_specimen_status_id", using: :btree
  add_index "orders", ["specimen_type_id"], name: "index_orders_on_specimen_type_id", using: :btree
  add_index "orders", ["ward_id"], name: "index_orders_on_ward_id", using: :btree

  create_table "panel_types", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "doc_id",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "panels", force: :cascade do |t|
    t.integer  "panel_type_id", limit: 8
    t.integer  "test_type_id",  limit: 8
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "panels", ["panel_type_id"], name: "index_panels_on_panel_type_id", using: :btree
  add_index "panels", ["test_type_id"], name: "index_panels_on_test_type_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "patient_id",   limit: 255
    t.string   "npid",         limit: 255
    t.string   "first_name",   limit: 255
    t.string   "last_name",    limit: 255
    t.string   "middle_name",  limit: 255
    t.string   "email",        limit: 255
    t.string   "dob",          limit: 255
    t.string   "phone_number", limit: 255
    t.string   "gender",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "district",         limit: 255
    t.float    "x",                limit: 24
    t.float    "y",                limit: 24
    t.string   "region",           limit: 255
    t.string   "description",      limit: 255
    t.boolean  "enabled"
    t.boolean  "sync_status"
    t.string   "site_code",        limit: 255
    t.string   "application_port", limit: 255
    t.string   "host_address",     limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "specimen_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "doc_id",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "specimen_types", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "doc_id",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "test_categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "doc_id",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "test_results", force: :cascade do |t|
    t.integer  "test_id",      limit: 8
    t.integer  "measure_id",   limit: 8
    t.string   "result",       limit: 255
    t.string   "doc_id",       limit: 255
    t.datetime "time_entered"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "test_results", ["measure_id"], name: "index_test_results_on_measure_id", using: :btree
  add_index "test_results", ["test_id"], name: "index_test_results_on_test_id", using: :btree

  create_table "test_status_updates", force: :cascade do |t|
    t.integer  "test_id",          limit: 8
    t.integer  "test_status_id",   limit: 8
    t.string   "doc_id",           limit: 255
    t.datetime "time_updated"
    t.string   "who_updated_id",   limit: 255
    t.string   "who_updated_name", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "test_status_updates", ["test_id"], name: "index_test_status_updates_on_test_id", using: :btree
  add_index "test_status_updates", ["test_status_id"], name: "index_test_status_updates_on_test_status_id", using: :btree

  create_table "test_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "doc_id",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "test_types", force: :cascade do |t|
    t.integer  "test_category_id", limit: 8
    t.string   "name",             limit: 255, null: false
    t.string   "short_name",       limit: 200
    t.string   "targetTAT",        limit: 255
    t.string   "doc_id",           limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "test_types", ["test_category_id"], name: "index_test_types_on_test_category_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.string   "order_id",       limit: 255
    t.integer  "test_type_id",   limit: 8
    t.integer  "test_status_id", limit: 8
    t.datetime "time_created"
    t.string   "doc_id",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tests", ["order_id"], name: "index_tests_on_order_id", using: :btree
  add_index "tests", ["test_status_id"], name: "index_tests_on_test_status_id", using: :btree
  add_index "tests", ["test_type_id"], name: "index_tests_on_test_type_id", using: :btree

  create_table "testtype_measures", force: :cascade do |t|
    t.integer  "test_type_id", limit: 8
    t.integer  "measure_id",   limit: 8
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "testtype_measures", ["measure_id"], name: "index_testtype_measures_on_measure_id", using: :btree
  add_index "testtype_measures", ["test_type_id"], name: "index_testtype_measures_on_test_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "app_name",          limit: 255,                     null: false
    t.string   "partner",           limit: 255,                     null: false
    t.string   "location",          limit: 255,                     null: false
    t.string   "password",          limit: 255,                     null: false
    t.string   "username",          limit: 255,                     null: false
    t.string   "token",             limit: 255, default: "xxxxxxx", null: false
    t.datetime "token_expiry_time"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "wards", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "doc_id",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
