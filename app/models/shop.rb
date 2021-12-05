  # create_table "shops", force: :cascade do |t|
  #   t.string "name"
  #   t.string "tel_number"
  #   t.string "address"
  #   t.string "access"
  #   t.string "open"
  #   t.string "close"
  #   t.integer "member_number"
  #   t.string "member_since"
  #   t.string "pizza_maker"
  #   t.string "oven_used"
  #   t.string "url"
  #   t.float "latitude"
  #   t.float "longitude"
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  #   t.bigint "prefecture_id", null: false
  #   t.index ["prefecture_id"], name: "index_shops_on_prefecture_id"
  # end

class Shop < ApplicationRecord
  belongs_to :prefecture
end
