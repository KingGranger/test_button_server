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

ActiveRecord::Schema.define(version: 20180707222900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arena_images", force: :cascade do |t|
    t.bigint "arena_id"
    t.bigint "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_deleted"
    t.index ["arena_id"], name: "index_arena_images_on_arena_id"
    t.index ["image_id"], name: "index_arena_images_on_image_id"
  end

  create_table "arenas", force: :cascade do |t|
    t.string "arena_name"
    t.string "city"
    t.string "state"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authentications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "auth_string"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "drawings", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.boolean "is_drawing_winner"
    t.datetime "drawing_datetime"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_drawings_on_event_id"
    t.index ["user_id"], name: "index_drawings_on_user_id"
  end

  create_table "event_images", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_deleted"
    t.index ["event_id"], name: "index_event_images_on_event_id"
    t.index ["image_id"], name: "index_event_images_on_image_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "event_description"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "arena_id"
    t.bigint "event_type_id"
    t.integer "max_winners"
    t.datetime "event_datetime"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arena_id"], name: "index_events_on_arena_id"
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
  end

  create_table "images", force: :cascade do |t|
    t.binary "image_data"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.boolean "terms_of_agreement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "email"
  end

  add_foreign_key "arena_images", "arenas"
  add_foreign_key "arena_images", "images"
  add_foreign_key "authentications", "users"
  add_foreign_key "drawings", "events"
  add_foreign_key "drawings", "users"
  add_foreign_key "event_images", "events"
  add_foreign_key "event_images", "images"
  add_foreign_key "events", "arenas"
  add_foreign_key "events", "event_types"
end
