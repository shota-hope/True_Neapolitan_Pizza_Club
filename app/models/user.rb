class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :posts, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :visited_shops, through: :visits, source: :shop

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :profile, length: { maximum: 3000 }

  def visit(shop)
    visited_shops << shop
  end

  def unvisit(shop)
    visited_shops.destroy(shop)
  end

  def visit?(shop)
    visited_shops.include?(shop)
  end
end
