require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションテスト" do
    # なまえ、メール、パスワードがあれば有効な状態であること
    it "is valid with a name, email, password, password_confirmation" do
      user = create(:user)
      expect(user).to be_valid
    end

    # 名がなければ無効な状態であること
    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
      create(:user, email: "hogehoge@example.com")
      user = build(:user, email: "hogehoge@example.com")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
  end
end
