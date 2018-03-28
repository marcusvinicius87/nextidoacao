class AddLoginToUsuarioNextis < ActiveRecord::Migration[5.1]
  def change
    add_column :usuario_nextis, :login, :string
  end
end
