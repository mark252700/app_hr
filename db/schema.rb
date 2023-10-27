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

ActiveRecord::Schema[7.0].define(version: 2023_10_25_004518) do
  create_table "benefits", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "benefit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "emp_detail_id", null: false
    t.index ["emp_detail_id"], name: "index_benefits_on_emp_detail_id"
  end

  create_table "competencies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "competencies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "taskperformance_id", null: false
    t.index ["taskperformance_id"], name: "index_competencies_on_taskperformance_id"
  end

  create_table "emp_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "fullname"
    t.integer "emp_id"
    t.string "rank"
    t.string "division"
    t.string "sup_name"
    t.string "pos_title"
    t.integer "ser_year"
    t.integer "ser_month"
    t.string "educ_course"
    t.datetime "educ_grad"
    t.string "educ_skill"
    t.string "educ_certificate"
    t.string "educ_othskill"
    t.string "contact"
    t.string "department"
    t.string "sup_title"
    t.integer "hr_perday"
    t.integer "hr_perweek"
    t.string "break"
    t.string "launch"
    t.boolean "ot_weekday"
    t.boolean "ot_weekend"
    t.integer "workday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.index ["user_id"], name: "index_emp_details_on_user_id"
  end

  create_table "jb_descriptions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_jb_descriptions_on_user_id"
  end

  create_table "jb_performeds", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "job_performed"
    t.string "job_done"
    t.integer "job_hr"
    t.integer "job_min"
    t.boolean "job_current"
    t.string "job_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "jb_description_id", null: false
    t.index ["jb_description_id"], name: "index_jb_performeds_on_jb_description_id"
  end

  create_table "nested_othperformes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "job_performed"
    t.string "job_done"
    t.integer "job_hr"
    t.integer "job_min"
    t.boolean "job_current"
    t.string "job_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "oth_performed_id", null: false
    t.index ["oth_performed_id"], name: "index_nested_othperformes_on_oth_performed_id"
  end

  create_table "nested_taskperformances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "task_notdone"
    t.string "task_reason"
    t.string "task_impact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "taskperformance_id", null: false
    t.index ["taskperformance_id"], name: "index_nested_taskperformances_on_taskperformance_id"
  end

  create_table "nested_trainings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "train_type"
    t.string "train_benefit"
    t.string "sup_name"
    t.string "sup_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "req_training_id", null: false
    t.index ["req_training_id"], name: "index_nested_trainings_on_req_training_id"
  end

  create_table "notrel_trainings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "train_type"
    t.string "train_benefit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "req_training_id", null: false
    t.index ["req_training_id"], name: "index_notrel_trainings_on_req_training_id"
  end

  create_table "oth_competencies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "competency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "oth_performed_id", null: false
    t.index ["oth_performed_id"], name: "index_oth_competencies_on_oth_performed_id"
  end

  create_table "oth_performeds", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "job_performed"
    t.string "job_done"
    t.integer "job_hr"
    t.string "job_min"
    t.string "integer"
    t.boolean "job_current"
    t.string "job_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_oth_performeds_on_user_id"
  end

  create_table "oth_positions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "pos_title"
    t.integer "pos_yr"
    t.string "pos_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "oth_performed_id", null: false
    t.index ["oth_performed_id"], name: "index_oth_positions_on_oth_performed_id"
  end

  create_table "oth_tasks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "oth_tasknotdone"
    t.string "oth_reason"
    t.string "oth_impact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_oth_tasks_on_user_id"
  end

  create_table "other_competencies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "competencies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "oth_performed_id", null: false
    t.index ["oth_performed_id"], name: "index_other_competencies_on_oth_performed_id"
  end

  create_table "other_tasks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "task_notdone"
    t.string "task_reason"
    t.string "task_impact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "oth_performed_id", null: false
    t.index ["oth_performed_id"], name: "index_other_tasks_on_oth_performed_id"
  end

  create_table "rel_trainings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "train_type"
    t.string "train_benefit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "req_training_id", null: false
    t.index ["req_training_id"], name: "index_rel_trainings_on_req_training_id"
  end

  create_table "req_competencies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "competencies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_req_competencies_on_user_id"
  end

  create_table "req_trainings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "train_type"
    t.string "train_benefit"
    t.string "sup_name"
    t.string "sup_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_req_trainings_on_user_id"
  end

  create_table "task_performances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "task_notdone"
    t.string "task_reason"
    t.string "task_impact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_task_performances_on_user_id"
  end

  create_table "taskperformances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "task_notdone"
    t.string "task_reason"
    t.string "task_impact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_taskperformances_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "role", default: false
    t.boolean "approved", default: false
    t.boolean "submitted", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "benefits", "emp_details"
  add_foreign_key "competencies", "taskperformances"
  add_foreign_key "emp_details", "users"
  add_foreign_key "jb_descriptions", "users"
  add_foreign_key "jb_performeds", "jb_descriptions"
  add_foreign_key "nested_othperformes", "oth_performeds"
  add_foreign_key "nested_taskperformances", "taskperformances"
  add_foreign_key "nested_trainings", "req_trainings"
  add_foreign_key "notrel_trainings", "req_trainings"
  add_foreign_key "oth_competencies", "oth_performeds"
  add_foreign_key "oth_performeds", "users"
  add_foreign_key "oth_positions", "oth_performeds"
  add_foreign_key "oth_tasks", "users"
  add_foreign_key "other_competencies", "oth_performeds"
  add_foreign_key "other_tasks", "oth_performeds"
  add_foreign_key "rel_trainings", "req_trainings"
  add_foreign_key "req_competencies", "users"
  add_foreign_key "req_trainings", "users"
  add_foreign_key "task_performances", "users"
  add_foreign_key "taskperformances", "users"
end
