class AddAutorToCadastros < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :autor, :string
  end
end
