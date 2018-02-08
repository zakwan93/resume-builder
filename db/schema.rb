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

ActiveRecord::Schema.define(version: 20180201040739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.string "name"
    t.string "degree"
    t.string "year_graduated"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string "job_title"
    t.string "company"
    t.string "startdate"
    t.string "enddate"
    t.text "description"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "introductions", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "objectives", force: :cascade do |t|
    t.text "description"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "otherprojects", force: :cascade do |t|
    t.string "name"
    t.string "desc1"
    t.string "desc2"
    t.string "desc3"
    t.string "desc4"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "experience_id"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reskills", force: :cascade do |t|
    t.integer "resume_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "summary", force: :cascade do |t|
    t.text "description"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
