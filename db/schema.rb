# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_30_055505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendar_events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "user_id", null: false
    t.integer "tenant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "website"
    t.string "email"
    t.string "phone"
    t.integer "user_id", null: false
    t.integer "tenant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.text "description"
    t.string "website"
    t.string "email"
    t.integer "user_id", null: false
    t.integer "tenant_id", null: false
    t.integer "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "title"
    t.string "job_title"
    t.string "job_department"
    t.string "home_phone"
    t.string "work_phone"
    t.string "mobile_phone"
    t.string "address"
    t.date "birthday"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "model"
    t.string "manufacturer"
    t.integer "user_id"
    t.integer "tenant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "form_templates", force: :cascade do |t|
    t.string "name"
    t.integer "tenant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "form_templates_apps", force: :cascade do |t|
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.integer "user_id", null: false
    t.integer "tenant_id", null: false
    t.integer "form_template_id", null: false
    t.integer "contact_id"
    t.integer "equipment_id"
    t.integer "project_id"
    t.integer "calendar_event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id", null: false
    t.integer "tenant_id", null: false
    t.integer "contact_id"
    t.integer "task_id"
    t.integer "equipment_id"
    t.integer "project_id"
    t.integer "calendar_event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "company_id"
  end

  create_table "project_companies", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_project_companies_on_company_id"
    t.index ["project_id"], name: "index_project_companies_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.integer "user_id", null: false
    t.integer "tenant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "due_date"
    t.boolean "completed"
    t.integer "user_id"
    t.integer "tenant_id"
    t.integer "contact_id"
    t.integer "equipment_id"
    t.integer "project_id"
    t.integer "calendar_event_id"
    t.integer "note_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "company_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.boolean "notes_app"
    t.boolean "contacts_app"
    t.boolean "forms_app"
    t.boolean "tasks_app"
    t.boolean "equipment_app"
    t.boolean "projects_app"
    t.boolean "calendar_app"
    t.boolean "timesheets_app"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "form_templates_app"
    t.boolean "companies_app"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unconfirmed_email"
    t.integer "tenant_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
