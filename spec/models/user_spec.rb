require 'rails_helper'

RSpec.describe User, type: :model do
  # なまえ、メール、パスワードがあれば有効な状態であること
  it "is valid with a name, email, password, password_confirmation" do
    user = User.new(
      name: "ohno",
      email: "ohno23@example.com",
      password: "ohnoohno",
      password_confirmation: "ohnoohno"
      )
    expect(user).to be_valid
  end

  # 名がなければ無効な状態であること
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    User.create(
      name: "ohno",
      email: "ohno23@example.com",
      password: "ohnoohno",
      password_confirmation: "ohnoohno"
      )
    user = User.new(
      name: "oono",
      email: "ohno23@example.com",
      password: "oonooono",
      password_confirmation: "oonooono"
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  # 重複したメールアドレスなら無効な状態であること
  # it "is invalid with a duplicate email address"
  # パスワードがなければ無効な状態であること
  # it "is invalid without a password"
end
