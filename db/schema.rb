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

ActiveRecord::Schema[7.2].define(version: 2024_08_26_211030) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["checksum"], name: "index_active_storage_blobs_on_checksum", unique: true
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "briquette_job_assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shift_id"
    t.date "date"
    t.integer "scheduled_hours_blast"
    t.integer "scheduled_hours_bop"
    t.integer "total_scheduled_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_briquette_job_assignments_on_shift_id"
    t.index ["user_id"], name: "index_briquette_job_assignments_on_user_id"
  end

  create_table "briquette_job_timesheets", force: :cascade do |t|
    t.bigint "briquette_assignment_id"
    t.time "start_time"
    t.integer "briquette_speed"
    t.boolean "bop_or_blast"
    t.decimal "dry_material"
    t.decimal "wet_bentonite"
    t.string "pug_mill_one_amp"
    t.integer "water"
    t.string "tons_per_hour"
    t.string "briquette_moisture"
    t.string "pug_mill_two_amp"
    t.string "bulk_density"
    t.string "lime"
    t.string "molasses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["briquette_assignment_id"], name: "index_briquette_job_timesheets_on_briquette_assignment_id"
  end

  create_table "dryer_job_assignments", force: :cascade do |t|
    t.bigint "shift_id"
    t.bigint "user_id"
    t.date "date"
    t.string "blend"
    t.integer "num_bays_full_blast"
    t.decimal "bentonite_inventory_end_of_shift"
    t.decimal "cement_inventory_end_of_shift"
    t.decimal "molasses_inventory_tank_one_end_of_shift"
    t.decimal "molasses_inventory_tank_two_end_of_shift"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_dryer_job_assignments_on_shift_id"
    t.index ["user_id"], name: "index_dryer_job_assignments_on_user_id"
  end

  create_table "dryer_timesheets", force: :cascade do |t|
    t.bigint "dryer_assignment_id"
    t.time "start_time"
    t.decimal "material_rate_bin_a"
    t.decimal "cyclone_photo"
    t.decimal "control_setpoint"
    t.decimal "control_temp"
    t.integer "gas_valve_position"
    t.integer "background_temp"
    t.decimal "baghouse_temp"
    t.decimal "baghouse_fan_amp"
    t.decimal "material_moisture"
    t.decimal "air_compression"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dryer_assignment_id"], name: "index_dryer_timesheets_on_dryer_assignment_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "category"
    t.integer "quantity", default: 0
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_equipment_on_user_id"
  end

  create_table "inspect_skidsteers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "inspector_name"
    t.integer "shift"
    t.integer "machine_hours"
    t.integer "structural_damage"
    t.string "structural_damage_comments"
    t.integer "tires_tracks"
    t.string "tire_tracks_comments"
    t.integer "glass_mirrors"
    t.string "glass_mirrors_comments"
    t.integer "electrical_connections"
    t.string "electrical_connections_comments"
    t.integer "hydraulic_hoses"
    t.string "hydraulic_hoses_comments"
    t.integer "lubrication"
    t.string "lubrication_comments"
    t.integer "fluid_levels"
    t.string "fluid_levels_comments"
    t.integer "engine_oil"
    t.string "engine_oil_comments"
    t.integer "coolant"
    t.string "coolant_comments"
    t.integer "fire_extinguisher"
    t.string "fire_extinguisher_comments"
    t.integer "seat_belts"
    t.string "seat_belts_comments"
    t.integer "operating_controls"
    t.string "operating_controls_comments"
    t.integer "horn_gauges"
    t.string "horn_gauges_comments"
    t.integer "lights_reflectors"
    t.string "lights_reflectors_comments"
    t.integer "windsheild_wipers"
    t.string "windsheild_wipers_comments"
    t.integer "ac_heat"
    t.string "ac_heat_comments"
    t.integer "steering_system"
    t.string "steering_system_comments"
    t.integer "brakes"
    t.string "brakes_comments"
    t.integer "backup_alarm"
    t.string "backup_alarm_comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_inspect_skidsteers_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name", limit: 255, default: "", null: false
    t.string "last_name", limit: 255, default: "", null: false
    t.string "role", default: "employee"
    t.string "status", default: "inactive"
    t.string "notes", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.integer "shift_number"
    t.string "job_type"
    t.string "status", default: "unassigned"
    t.string "notes", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shifts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "equipment", "users"
  add_foreign_key "inspect_skidsteers", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "shifts", "users"
end
