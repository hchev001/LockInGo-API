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

ActiveRecord::Schema[8.1].define(version: 2026_02_02_173628) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "audit_logs", force: :cascade do |t|
    t.string "action"
    t.string "actor"
    t.json "after"
    t.json "before"
    t.datetime "created_at", null: false
    t.string "entity"
    t.integer "entity_id"
    t.string "ts"
    t.datetime "updated_at", null: false
  end

  create_table "earing_rules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "daily_cap"
    t.json "params"
    t.string "rounding"
    t.string "rule_type"
    t.integer "task_id"
    t.integer "token_type_id"
    t.datetime "updated_at", null: false
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "is_active"
    t.string "mode"
    t.json "params"
    t.integer "token_type_id"
    t.datetime "updated_at", null: false
    t.datetime "valid_from"
    t.datetime "valid_to"
  end

  create_table "ledger_entries", force: :cascade do |t|
    t.decimal "balance_after"
    t.datetime "created_at", null: false
    t.string "delta"
    t.string "kind"
    t.string "memo"
    t.integer "ref_id"
    t.string "ref_type"
    t.string "ts"
    t.datetime "updated_at", null: false
    t.integer "wallet_id"
  end

  create_table "occurrences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "notes"
    t.string "scheduled_for"
    t.string "status"
    t.integer "task_id"
    t.datetime "updated_at", null: false
  end

  create_table "redemptions", force: :cascade do |t|
    t.datetime "canceled_at"
    t.decimal "cost_rcr"
    t.datetime "created_at", null: false
    t.datetime "fulfilled_at"
    t.string "notes"
    t.decimal "qty"
    t.datetime "requested_at"
    t.integer "reward_item_id"
    t.string "status"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "reward_items", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "description"
    t.boolean "is_active"
    t.boolean "is_unlimited"
    t.decimal "price_rcr"
    t.decimal "stock_qty"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.float "duration_sec"
    t.datetime "ended_at"
    t.integer "occurrence_id"
    t.string "source"
    t.datetime "started_at"
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "key"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "value"
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "task_filters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "key"
    t.integer "task_id"
    t.datetime "updated_at", null: false
    t.string "value"
  end

  create_table "task_recurrences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "cron_expr"
    t.integer "task_id"
    t.string "type"
    t.datetime "updated_at", null: false
    t.datetime "window_end"
    t.datetime "window_start"
  end

  create_table "task_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "tag_id"
    t.integer "task_id"
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.string "description"
    t.datetime "due_at"
    t.string "icon"
    t.boolean "is_active"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "token_types", force: :cascade do |t|
    t.string "code"
    t.string "color"
    t.datetime "created_at", null: false
    t.string "icon"
    t.boolean "is_active"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "password"
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "balance"
    t.datetime "created_at", null: false
    t.string "currency_code"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end
end
