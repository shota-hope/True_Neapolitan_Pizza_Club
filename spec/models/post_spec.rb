require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "バリデーション確認" do
    let(:user){ create(:user) }
    let!(:shop){ create(:shop) }

    it "タイトルと本文があれば投稿できること" do
      post = create(:post)
      expect(post).to be_valid
    end

    it "タイトルがなければエラーを返すこと" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "本文が10000文字以内の場合有効であること" do
      post = create(:post, body: 'a' * 10000)
      expect(post).to be_valid
    end

    it "本文が10001文字以上の場合無効であること" do
      post = build(:post, body: 'a' * 10001)
      expect(post).to be_invalid
      expect(post.errors[:body]).to include('は10000文字以内で入力してください')
    end
  end
end

# ext '本文が65535文字以内の場合' do
#     it '有効であること' do
#       comment = build(:comment, body: 'a' * 65535)
#       expect(comment).to be_valid
#     end
#   end

#   context '本文が65536文字以上の場合' do
#     it '無効であること' do
#       comment = build(:comment, body: 'a' * 65536)
#       expect(comment).to be_invalid
#       expect(comment.errors[:body]).to include('は65535文字以内で入力してください')
#     end
