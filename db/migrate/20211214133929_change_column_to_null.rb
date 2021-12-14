class ChangeColumnToNull < ActiveRecord::Migration[6.1]
    def up
    change_column_null :prefectures, :shop_id, true
  end

  def down
    change_column_null :prefectures, :shop_id, false
  end
end
