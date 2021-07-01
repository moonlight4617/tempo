require "rails_helper"

RSpec.describe Owner, type: :system do
  describe "オーナー作成から削除" do
    context "新規作成出来ないパターン" do
      before do
        visit o_new_path
      end
      it "名前が空" do
        fill_in "name", with: ""
        fill_in "email", with: "registration@example.com"
        fill_in "password", with: "12345678"
        fill_in "password_confirmation", with: "12345678"
        click_button "登録"
        aggregate_failures do
          expect(current_path).to eq o_new_path
          expect(page).to have_selector(".alert-warning", text: "登録情報が正しく入力されていません")
        end
      end

      it "emailが空" do
        fill_in "name", with: "sampleowner"
        fill_in "email", with: ""
        fill_in "password", with: "12345678"
        fill_in "password_confirmation", with: "12345678"
        click_button "登録"
        aggregate_failures do
          expect(current_path).to eq o_new_path
          expect(page).to have_selector(".alert-warning", text: "登録情報が正しく入力されていません")
        end
      end

      it "passwordが空" do
        fill_in "name", with: "sampleowner"
        fill_in "email", with: "registration@example.com"
        fill_in "password", with: ""
        fill_in "password_confirmation", with: "12345678"
        click_button "登録"
        aggregate_failures do
          expect(current_path).to eq o_new_path
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
          expect(current_path).to eq o_new_path
          expect(page).to have_selector(".alert-warning", text: "登録情報が正しく入力されていません")
        end
      end
    end

    context "オーナー周りの正常な挙動" do
      before do 
        visit o_new_path
        fill_in "name", with: "新規登録テストオーナー"
        fill_in "email", with: "registration@example.com"
        fill_in "password", with: "12345678"
        fill_in "password_confirmation", with: "12345678"
        click_button "登録"
      end
      it "新規作成" do
        expect(current_path).to eq s_new_path
      end

      it "編集・更新" do
        visit owner_login_path
        fill_in "inputEmail", with: "registration@example.com"
        fill_in "inputPassword", with: "12345678"
        click_button "ログイン"
        expect(current_path).to eq o_show_path
        visit o_edit_path
        fill_in "name", with: "編集後のテストオーナー"
        click_button "登録"
        aggregate_failures do
          expect(current_path).to eq o_show_path
          expect(page).to have_content "編集後のテストオーナー"
        end
      end

      it "オーナーが削除された時の挙動" do
        visit o_edit_path
        page.accept_confirm do
          click_link "オーナーアカウントを削除する"
        end
        aggregate_failures do
          expect(current_path).to eq root_path
          expect(page).to have_content "オーナー情報は削除されました"
        end
      end
    end
  end
end