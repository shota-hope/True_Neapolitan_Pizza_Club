class Post < ApplicationRecord
  mount_uploaders :image, ImageUploader
  serialize :image, JSON

  belongs_to :user
  belongs_to :shop

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 10000 }
  validate :validate_number_of_files

  FILE_NUMBER_LIMIT = 4

  def set_date
    created_at.strftime("%Y年%m月%d日 %R")
  end

  private

  def validate_number_of_files
    return if image.length <= FILE_NUMBER_LIMIT
      errors.add(:image, "に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end
end
