class AddLoginToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :login, :string
  end
end
