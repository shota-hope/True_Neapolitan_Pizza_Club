class Post < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 10000 }
end
