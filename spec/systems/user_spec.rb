require "rails_helper"

RSpec.describe User, type: :system do
  describe "ユーザー作成から削除" do
    context "新規作成出来ないパターン" do
      before do
        visit u_new_path
      end
      it "名前が空" do
        fill_in "name", with: ""
        fill_in "email", with: "registration@example.com"
        fill_in "password", with: "12345678"
        fill_in "password_confirmation", with: "12345678"
        click_button "登録"
        aggregate_failures do
          expect(current_path).to eq u_new_path
          expect(page).to have_selector(".alert-warning", text: "登録情報が正しく入力されていません")
        end
      end

      it "emailが空" do
        fill_in "name", with: "sampleuser"
        fill_in "email", with: ""
        fill_in "password", with: "12345678"
        fill_in "password_confirmation", with: "12345678"
        click_button "登録"
        aggregate_failures do
          expect(current_path).to eq u_new_path
          expect(page).to have_selector(".alert-warning", text: "登録情報が正しく入力されていません")
        end
      end

      it "passwordが空" do
        fill_in "name", with: "sampleuser"
        fill_in "email", with: "registration@example.com"
        fill_in "password", with: ""
        fill_in "password_confirmation", with: "12345678"
        click_button "登録"
        aggregate_failures do
          expect(current_path).to eq u_new_path
          expect(page).to have_selector(".alert-warning", text: "登録情報が正しく入力されていません")
        end
      end

      it "passwordとpassword_confirmationが別" do
        fill_in "name", with: "sample_user"
        fill_in "email", with: "registration@example.com"
        fill_in "password", with: "12345678"
        fill_in "password_confirmation", with: "87654321"
        click_button "登録"
        aggregate_failures do
          expect(current_path).to eq u_new_path
          expect(page).to have_selector(".alert-warning", text: "登録情報が正しく入力されていません")
        end
      end

      it "passwordが6文字未満" do
        fill_in "name", with: "sample_user"
        fill_in "email", with: "registration@example.com"
        fill_in "password", with: "12345"
        fill_in "password_confirmation", with: "12345"
        click_button "登録"
        aggregate_failures do
          expect(current_path).to eq u_new_path
          expect(page).to have_selector(".alert-warning", text: "登録情報が正しく入力されていません")
        end
      end
    end

    context "ユーザー周りの正常な挙動" do
      before do 
        visit u_new_path
        fill_in "name", with: "新規登録テストユーザー"
        fill_in "email", with: "registration@example.com"
        fill_in "password", with: "Abcdefgh"
        fill_in "password_confirmation", with: "Abcdefgh"
        click_button "登録"
      end
      it "新規作成" do
        expect(current_path).to eq u_show_path(User.last)
      end

      it "Eメールが大文字小文字区別しない" do
        visit user_login_path
        fill_in "inputEmail", with: "REGISTRATION@example.com"
        fill_in "inputPassword", with: "Abcdefgh"
        click_button "ログイン"
        expect(current_path).to eq s_index_path
      end

      it "編集・更新" do
        visit user_login_path
        fill_in "inputEmail", with: "registration@example.com"
        fill_in "inputPassword", with: "Abcdefgh"
        click_button "ログイン"
        expect(current_path).to eq s_index_path
        visit u_edit_path
        fill_in "name", with: "編集後のテストユーザー"
        click_button "登録"
        aggregate_failures do
          expect(current_path).to eq u_show_path
          expect(page).to have_content "編集後のテストユーザー"
        end
      end

      it "ユーザーが削除された時の挙動" do
        visit u_edit_path
        page.accept_confirm do
          click_link "アカウントの削除"
        end
        aggregate_failures do
          expect(current_path).to eq root_path
          expect(page).to have_content "ユーザー情報は削除されました"
        end
      end
    end
  end
end