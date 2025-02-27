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

ActiveRecord::Schema[8.0].define(version: 2025_02_27_144406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bullet_point_topics", force: :cascade do |t|
    t.bigint "bullet_point_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bullet_point_id"], name: "index_bullet_point_topics_on_bullet_point_id"
    t.index ["topic_id"], name: "index_bullet_point_topics_on_topic_id"
  end

  create_table "bullet_points", force: :cascade do |t|
    t.bigint "note_id", null: false
    t.string "classification", null: false
    t.string "statement", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_bullet_points_on_note_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id", null: false
    t.bigint "note_id"
    t.string "role"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["note_id"], name: "index_messages_on_note_id"
  end

  create_table "note_topics", force: :cascade do |t|
    t.bigint "note_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_note_topics_on_note_id"
    t.index ["topic_id"], name: "index_note_topics_on_topic_id"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "entry_type", null: false
    t.string "orignal_text", null: false
    t.jsonb "llm_summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.integer "parent_topic_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_topic_id"], name: "index_topics_on_parent_topic_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "bullet_point_topics", "bullet_points"
  add_foreign_key "bullet_point_topics", "topics"
  add_foreign_key "bullet_points", "notes"
  add_foreign_key "conversations", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "notes"
  add_foreign_key "note_topics", "notes"
  add_foreign_key "note_topics", "topics"
  add_foreign_key "notes", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "topics", "topics", column: "parent_topic_id"
  add_foreign_key "topics", "users"
end
