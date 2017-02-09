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

ActiveRecord::Schema.define(version: 20170209133417) do

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_attendances_on_meeting_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.integer  "medical_condition_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["medical_condition_id"], name: "index_conditions_on_medical_condition_id"
    t.index ["user_id"], name: "index_conditions_on_user_id"
  end

  create_table "enrolments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "initiative_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["initiative_id"], name: "index_enrolments_on_initiative_id"
    t.index ["user_id"], name: "index_enrolments_on_user_id"
  end

  create_table "initiatives", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "area_id"
    t.string   "location"
  end

  create_table "medical_conditions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_medical_conditions_on_user_id"
  end

  create_table "medical_conditions_users", force: :cascade do |t|
    t.integer "medical_conditions_id"
    t.integer "users_id"
    t.index ["medical_conditions_id"], name: "index_medical_conditions_users_on_medical_conditions_id"
    t.index ["users_id"], name: "index_medical_conditions_users_on_users_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "datetime"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "initiative_id"
    t.index ["initiative_id"], name: "index_meetings_on_initiative_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "telephone"
    t.date     "dob"
    t.integer  "privilege"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
