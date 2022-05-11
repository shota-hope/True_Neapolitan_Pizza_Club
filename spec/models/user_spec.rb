require 'rails_helper'

RSpec.describe User, type: :model do

  # describe User do
  #   it "有効なファクトリを持つこと" do
  #     expect(FactoryBot.build(:user)).to be_valid
  #   end
  # end


  describe "verification of validation" do
    # なまえ、メール、パスワードがあれば有効な状態であること
    before do
      @user = User.create(
        name: "ohno",
        email: "ohno23@example.com",
        password: "ohnoohno",
        password_confirmation: "ohnoohno"
        )
    end
    
    it "is valid with a name, email, password, password_confirmation" do
      expect(@user).to be_valid
    end

    # 名がなければ無効な状態であること
    it "is invalid without a name" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user, email: "hogehoge@example.com")
      user = FactoryBot.build(:user, email: "hogehoge@example.com")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
  end
end
