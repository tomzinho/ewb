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

ActiveRecord::Schema.define(version: 2019_12_03_123145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applies", force: :cascade do |t|
    t.bigint "candidate_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_applies_on_candidate_id"
    t.index ["job_id"], name: "index_applies_on_job_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.bigint "user_id"
    t.text "small_desc"
    t.string "github_link"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "work_auth"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "workauth_bra"
    t.boolean "workauth_usa"
    t.boolean "workauth_eu"
    t.boolean "workauth_can"
    t.boolean "workauth_gb"
    t.boolean "workauth_aus"
    t.string "first_name"
    t.string "last_name"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id"
    t.string "website"
    t.string "facebook_link"
    t.string "twitter_link"
    t.string "logo"
    t.string "banner"
    t.integer "cnpj"
    t.string "address"
    t.string "latitude"
    t.string "longitude"
    t.boolean "term_of_use"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "company_id"
    t.string "title"
    t.text "description"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.bigint "candidate_id"
    t.string "resume_language"
    t.text "description"
    t.text "education"
    t.text "skills"
    t.text "experience"
    t.string "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_resumes_on_candidate_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "provider"
    t.string "uid"
    t.string "firstName"
    t.string "lastName"
    t.string "profilePicture"
    t.string "linkedin_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applies", "candidates"
  add_foreign_key "applies", "jobs"
  add_foreign_key "candidates", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "jobs", "companies"
  add_foreign_key "resumes", "candidates"
end
