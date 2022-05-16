require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:shop) { create(:shop) }
  let(:post) { create(:post) }


  describe 'ログイン前' do
    describe 'ページ遷移確認' do
      context '投稿ページにアクセス' do
        it '投稿ページへのアクセスが失敗する' do
          visit new_shop_post_path(shop)
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe '新規投稿する' do
      context 'フォームの入力値が正常' do
        it '新規投稿が成功する' do
          visit new_shop_post_path(shop)
          fill_in 'タイトル', with: 'Test title'
          fill_in '本文', with: 'Test body'
          click_button '投稿する'
          expect(page).to have_content '投稿しました'
          expect(page).to have_content 'Test title'
          expect(page).to have_content 'Test body'
          expect(page).to have_content "#{post.set_date}"
          expect(current_path).to eq shop_path(shop)
        end
      end
      context 'タイトルが未入力' do
        it '投稿が失敗する' do
          visit new_shop_post_path(shop)
          fill_in 'タイトル', with: ''
          fill_in '本文', with: 'Test body'
          click_button '投稿する'
          expect(page).to have_content '投稿に失敗しました'
          expect(page).to have_content 'タイトルを入力してください'
          expect(current_path).to eq shop_posts_path(shop)
        end
      end
    end
  end
end
