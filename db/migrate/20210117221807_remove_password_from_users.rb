class RemovePasswordFromUsers < ActiveRecord::Migration[5.2]
  # 不要なパスワードカラムを削除してpassword_digestだけに統一します。
  def change
    remove_column :users, :password, :string
  end
end
