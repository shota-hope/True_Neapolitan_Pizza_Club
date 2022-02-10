class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :shop

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 10000 }

  def set_date
    created_at.strftime("%Y年%m月%d日 %R")
  end
end
