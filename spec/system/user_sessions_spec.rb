require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        login_as(user)
        expect(page).to have_content 'ログインしました'
        expect(current_path).to eq root_path
      end
    end
  end
end
