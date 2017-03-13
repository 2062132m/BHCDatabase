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

ActiveRecord::Schema.define(version: 20170313163243) do

  create_table "answers", force: :cascade do |t|
    t.integer  "feedback_id"
    t.integer  "question_id"
    t.text     "response"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["feedback_id", "question_id"], name: "index_answers_on_feedback_id_and_question_id", unique: true
    t.index ["feedback_id"], name: "index_answers_on_feedback_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "archived",        default: false
    t.string   "reason_archived"
    t.index ["name"], name: "index_areas_on_name", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_attendances_on_meeting_id"
    t.index ["user_id", "meeting_id"], name: "index_attendances_on_user_id_and_meeting_id", unique: true
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.integer  "medical_condition_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["medical_condition_id", "user_id"], name: "index_conditions_on_medical_condition_id_and_user_id", unique: true
    t.index ["medical_condition_id"], name: "index_conditions_on_medical_condition_id"
    t.index ["user_id"], name: "index_conditions_on_user_id"
  end

  create_table "enrolments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "initiative_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["initiative_id"], name: "index_enrolments_on_initiative_id"
    t.index ["user_id", "initiative_id"], name: "index_enrolments_on_user_id_and_initiative_id", unique: true
    t.index ["user_id"], name: "index_enrolments_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "funders", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "url"
    t.text     "description"
    t.string   "email"
    t.string   "telephone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name", "email"], name: "index_funders_on_name_and_email", unique: true
  end

  create_table "initiatives", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "area_id"
    t.string   "location"
    t.boolean  "archived",        default: false
    t.string   "reason_archived"
    t.index ["name", "location"], name: "index_initiatives_on_name_and_location", unique: true
  end

  create_table "medical_conditions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "archived",        default: false
    t.string   "reason_archived"
    t.index ["name"], name: "index_medical_conditions_on_name", unique: true
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "datetime"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "initiative_id"
    t.integer  "attendance"
    t.index ["initiative_id", "datetime"], name: "index_meetings_on_initiative_id_and_datetime", unique: true
    t.index ["initiative_id"], name: "index_meetings_on_initiative_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question"
    t.boolean  "visible"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "multiple_choice"
    t.index ["question"], name: "index_questions_on_question", unique: true
  end

  create_table "service_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "request"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_service_requests_on_user_id"
  end

  create_table "unassigned_conditions", force: :cascade do |t|
    t.integer  "medical_condition_id"
    t.integer  "user_id"
    t.datetime "date_assigned"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["medical_condition_id"], name: "index_unassigned_conditions_on_medical_condition_id"
    t.index ["user_id"], name: "index_unassigned_conditions_on_user_id"
  end

  create_table "unenrolments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "initiative_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "date_enrolled"
    t.index ["initiative_id"], name: "index_unenrolments_on_initiative_id"
    t.index ["user_id"], name: "index_unenrolments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "telephone"
    t.date     "dob"
    t.integer  "privilege"
    t.date     "feedback_due"
    t.string   "emergency_contact"
    t.boolean  "archived",          default: false
    t.string   "reason_archived"
    t.index ["dob", "email", "telephone"], name: "index_users_on_dob_and_email_and_telephone", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end