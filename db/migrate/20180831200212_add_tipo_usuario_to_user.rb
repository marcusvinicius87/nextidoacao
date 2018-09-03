class AddTipoUsuarioToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :tipo_usuario, :string
  end
end
