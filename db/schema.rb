# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_21_140450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigns", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_assigns_on_team_id"
    t.index ["user_id"], name: "index_assigns_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.bigint "user_id", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plan_id"], name: "index_comments_on_plan_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "title", null: false
    t.text "detail"
    t.string "image"
    t.text "cause"
    t.text "goal", null: false
    t.text "gap", null: false
    t.date "due_date_at", null: false
    t.integer "priority", null: false
    t.integer "status", default: 0, null: false
    t.boolean "done_flag", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.index ["team_id"], name: "index_issues_on_team_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.text "action", null: false
    t.string "pic", null: false
    t.date "due_date_at", null: false
    t.integer "status", default: 0, null: false
    t.integer "feedback", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "issue_id", null: false
    t.bigint "team_id", null: false
    t.index ["issue_id"], name: "index_plans_on_issue_id"
    t.index ["team_id"], name: "index_plans_on_team_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "team_image"
    t.index ["owner_id"], name: "index_teams_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "department", null: false
    t.string "icon"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assigns", "teams"
  add_foreign_key "assigns", "users"
  add_foreign_key "comments", "plans"
  add_foreign_key "comments", "users"
  add_foreign_key "issues", "teams"
  add_foreign_key "issues", "users"
  add_foreign_key "plans", "issues"
  add_foreign_key "plans", "teams"
  add_foreign_key "plans", "users"
  add_foreign_key "teams", "users", column: "owner_id"
end
