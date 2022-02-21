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

ActiveRecord::Schema.define(version: 2022_02_21_142731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "image"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shop_id", null: false
    t.index ["shop_id"], name: "index_posts_on_shop_id"
    t.index ["user_id", "shop_id"], name: "index_posts_on_user_id_and_shop_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.bigint "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_prefectures_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "tel_number"
    t.string "address"
    t.string "access"
    t.string "open"
    t.string "close"
    t.integer "member_number"
    t.string "member_since"
    t.string "pizza_maker"
    t.string "oven_used"
    t.string "url"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "prefecture_id"
    t.index ["prefecture_id"], name: "index_shops_on_prefecture_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.text "profile"
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_visits_on_shop_id"
    t.index ["user_id", "shop_id"], name: "index_visits_on_user_id_and_shop_id", unique: true
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "posts", "shops"
  add_foreign_key "posts", "users"
  add_foreign_key "prefectures", "shops"
  add_foreign_key "shops", "prefectures"
  add_foreign_key "visits", "shops"
  add_foreign_key "visits", "users"
end
