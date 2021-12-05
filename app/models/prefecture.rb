# create_table "prefectures", force: :cascade do |t|
#     t.string "name"
#     t.bigint "shop_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["shop_id"], name: "index_prefectures_on_shop_id"
# end

class Prefecture < ApplicationRecord
  has_many :shops
end
