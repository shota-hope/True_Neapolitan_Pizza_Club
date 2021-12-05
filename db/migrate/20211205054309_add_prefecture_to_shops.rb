class AddPrefectureToShops < ActiveRecord::Migration[6.1]
  def change
    add_reference :shops, :prefecture, null: false, foreign_key: true
  end
end
