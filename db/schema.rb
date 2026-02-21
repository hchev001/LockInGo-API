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

ActiveRecord::Schema[8.1].define(version: 2026_02_21_043903) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "audit_logs", force: :cascade do |t|
    t.string "action", null: false
    t.string "actor", null: false
    t.json "after", null: false
    t.json "before", null: false
    t.datetime "created_at", null: false
    t.string "entity", null: false
    t.integer "entity_id", null: false
    t.datetime "updated_at", null: false
  end

  create_table "earning_rules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "daily_cap"
    t.json "params"
    t.string "rounding"
    t.string "rule_type", null: false
    t.bigint "task_id", null: false
    t.bigint "token_type_id", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_earning_rules_on_task_id"
    t.index ["token_type_id"], name: "index_earning_rules_on_token_type_id"
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "is_active"
    t.string "mode", null: false
    t.json "params"
    t.bigint "token_type_id", null: false
    t.datetime "updated_at", null: false
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.index ["token_type_id"], name: "index_exchange_rates_on_token_type_id"
  end

  create_table "ledger_entries", force: :cascade do |t|
    t.string "balance_after", null: false
    t.datetime "created_at", null: false
    t.string "decimal"
    t.decimal "delta"
    t.string "kind", null: false
    t.string "memo"
    t.integer "ref_id"
    t.string "ref_type"
    t.datetime "updated_at", null: false
    t.bigint "wallet_id", null: false
    t.index ["wallet_id"], name: "index_ledger_entries_on_wallet_id"
  end

  create_table "occurrences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "notes"
    t.datetime "scheduled_for"
    t.string "status"
    t.bigint "task_id", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_occurrences_on_task_id"
  end

  create_table "redemptions", force: :cascade do |t|
    t.datetime "canceled_at"
    t.decimal "cost", null: false
    t.datetime "created_at", null: false
    t.datetime "fulfilled_at"
    t.string "notes"
    t.decimal "qty", null: false
    t.datetime "requested_at"
    t.string "status", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_redemptions_on_user_id"
  end

  create_table "reward_items", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "description", null: false
    t.boolean "is_active"
    t.boolean "is_unlimited"
    t.decimal "price", null: false
    t.decimal "stock_qty", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "key", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "value"
    t.index ["key"], name: "index_settings_on_key", unique: true
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_recurrences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "cron_expr", null: false
    t.bigint "task_id", null: false
    t.datetime "updated_at", null: false
    t.datetime "window_end", null: false
    t.datetime "window_start", null: false
    t.index ["task_id"], name: "index_task_recurrences_on_task_id"
  end

  create_table "task_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "tag_id", null: false
    t.bigint "task_id", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_task_tags_on_tag_id"
    t.index ["task_id"], name: "index_task_tags_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.string "description"
    t.datetime "due_at"
    t.string "icon"
    t.boolean "is_active"
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "token_types", force: :cascade do |t|
    t.string "code", null: false
    t.string "color"
    t.datetime "created_at", null: false
    t.string "icon"
    t.boolean "is_active"
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_token_types_on_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false, comment: "User's email address, used for login and communication"
    t.string "name", null: false, comment: "User's full name for display purposes"
    t.string "password", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "balance"
    t.datetime "created_at", null: false
    t.string "currency_code"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "earning_rules", "tasks"
  add_foreign_key "earning_rules", "token_types"
  add_foreign_key "exchange_rates", "token_types"
  add_foreign_key "ledger_entries", "wallets"
  add_foreign_key "occurrences", "tasks"
  add_foreign_key "redemptions", "users"
  add_foreign_key "settings", "users"
  add_foreign_key "task_recurrences", "tasks"
  add_foreign_key "task_tags", "tags"
  add_foreign_key "task_tags", "tasks"
  add_foreign_key "tasks", "users"
  add_foreign_key "wallets", "users"
end
