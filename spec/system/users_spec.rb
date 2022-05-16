require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in '名前', with: 'foobar'
          fill_in 'メールアドレス', with: 'foobar@example.com'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content '入部しました'
          expect(current_path). to eq root_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in '名前', with: 'foobar'
          fill_in 'メールアドレス', with: ''
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content '入部に失敗しました'
          expect(page).to have_content 'メールアドレスを入力してください'
          expect(current_path).to eq users_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'ユーザー編集' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの編集が成功する' do
          visit edit_user_path(user)
          fill_in '名前', with: 'hogehoge'
          fill_in 'プロフィール', with: 'ピザが大好き'
          click_button '更新'
          expect(page).to have_content('更新しました')
          expect(current_path).to eq user_path(user)
        end
      end

      context '名前が未入力' do
        it 'ユーザーの編集が失敗する' do
          visit edit_user_path(user)
          fill_in '名前', with: ''
          fill_in 'プロフィール', with: 'ピザが大好き'
          click_button '更新'
          expect(page).to have_content '編集に失敗しました'
          expect(page).to have_content '名前を入力してください'
          expect(current_path).to eq user_path(user)
        end
      end
    end
  end
end
