class AddUserIdToCadastros < ActiveRecord::Migration[5.1]
  def change
  	add_reference :cadastros, :user, foreign_key: true
  end
end
