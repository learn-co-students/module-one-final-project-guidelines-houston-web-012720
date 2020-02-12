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

ActiveRecord::Schema.define(version: 2020_02_12_163839) do

  create_table "cohorts", force: :cascade do |t|
    t.string "program_type"
    t.date "start_date"
    t.string "location"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.integer "student_id"
    t.integer "lecture_id"
    t.string "what_did_i_learn"
    t.string "what_was_unclear"
    t.integer "confidence_level"
    t.text "feelings_on_topic"
    t.text "feelings_general"
    t.integer "mood"
    t.date "created_at"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "teacher"
    t.integer "module"
  end

  create_table "students", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "gender"
    t.integer "cohort_id"
  end

end
