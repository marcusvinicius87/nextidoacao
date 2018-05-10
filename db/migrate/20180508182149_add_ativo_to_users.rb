class AddAtivoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ativo, :boolean
  end
end
