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

ActiveRecord::Schema.define(version: 2021_11_09_104456) do

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "organization_name", null: false
    t.string "email", null: false
    t.integer "phone_number", null: false
    t.integer "subject", default: 0, null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "nickname", null: false
    t.string "organization_name"
    t.text "organization_url"
    t.text "profile_image_id"
    t.text "introduction"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_contributors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_contributors_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "post_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_favorites_on_post_id"
    t.index ["recipient_id"], name: "index_favorites_on_recipient_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "room_id"
    t.boolean "is_recipient", default: true, null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "contributor_id", null: false
    t.integer "genre", default: 1, null: false
    t.string "title", null: false
    t.text "content", null: false
    t.text "post_image_id"
    t.integer "status", default: 1, null: false
    t.integer "prefecture", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "organization_name", null: false
    t.text "organization_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_recipients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_recipients_on_reset_password_token", unique: true
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "contributor_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributor_id"], name: "index_relationships_on_contributor_id"
    t.index ["recipient_id"], name: "index_relationships_on_recipient_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "post_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_requests_on_post_id"
    t.index ["recipient_id"], name: "index_requests_on_recipient_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "post_id"
    t.boolean "chat_status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_rooms_on_post_id"
    t.index ["recipient_id"], name: "index_rooms_on_recipient_id"
  end

end
