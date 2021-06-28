require "rails_helper"

describe "ユーザー関連", type: :system do
  describe "新規作成から削除まで" do
    before do
      user_a = FactoryBot.create(:user, name: "サンプルユーザーA", email: "sample@example.com")
    end
    context "ユーザー新規作成の挙動" do
      before do
        visit user_login_path
        fill_in "inputEmail", with: "sample@example.com"
        fill_in "inputPassword", with: "12345678"
        click_button "ログイン"
      end

      it "店舗一覧画面へ遷移する" do
        uri = URI.parse(current_url)
        expect(uri.path).to eq s_index_path
      end
    end
  end
end