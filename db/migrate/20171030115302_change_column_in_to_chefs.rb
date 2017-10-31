class ChangeColumnInToChefs < ActiveRecord::Migration[5.0]
  def change
    rename_column :chefs,:passward_digest, :password_digest
  end
end
