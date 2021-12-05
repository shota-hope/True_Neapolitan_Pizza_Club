class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :tel_number
      t.string :address
      t.string :access
      t.string :open
      t.string :close
      t.integer :member_number
      t.string :member_since
      t.string :pizza_maker
      t.string :oven_used
      t.string :url
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
