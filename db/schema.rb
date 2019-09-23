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

ActiveRecord::Schema.define(version: 2019_09_21_021626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diagnoses", force: :cascade do |t|
    t.string "name", null: false
    t.string "diagnosis_code", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string "medication_name", null: false
    t.string "manufacturer", null: false
  end

  create_table "patient_diagnoses", force: :cascade do |t|
    t.bigint "diagnosis_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "provider_id", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.index ["diagnosis_id"], name: "index_patient_diagnoses_on_diagnosis_id"
    t.index ["patient_id"], name: "index_patient_diagnoses_on_patient_id"
    t.index ["provider_id"], name: "index_patient_diagnoses_on_provider_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "office_address", null: false
    t.string "office_city", null: false
    t.string "office_state", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.bigint "medication_id", null: false
    t.bigint "patient_id", null: false
    t.string "dosage", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.index ["medication_id"], name: "index_treatments_on_medication_id"
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "provider_id", null: false
    t.datetime "visit_date", null: false
    t.string "notes"
    t.index ["patient_id"], name: "index_visits_on_patient_id"
    t.index ["provider_id"], name: "index_visits_on_provider_id"
  end

  add_foreign_key "patient_diagnoses", "diagnoses"
  add_foreign_key "patient_diagnoses", "patients"
  add_foreign_key "patient_diagnoses", "providers"
  add_foreign_key "visits", "patients"
  add_foreign_key "visits", "providers"
end
