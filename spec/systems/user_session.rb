require "rails_helper"

RSpec.describe User, type: :system do
  before do
    user_a = FactoryBot.create(:user, name: "サンプルユーザーA", email: "sample@example.com")
    visit user_login_path
    fill_in "inputEmail", with: "sample@example.com"
    fill_in "inputPassword", with: "12345678"
    click_button "ログイン"
  end

  it "ログイン後の挙動" do
    uri = URI.parse(current_url)
    expect(uri.path).to eq s_index_path
  end
end