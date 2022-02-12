class AddShopToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :shop, null: false, foreign_key: true
    add_index :posts, [:user_id, :shop_id]
  end
end
