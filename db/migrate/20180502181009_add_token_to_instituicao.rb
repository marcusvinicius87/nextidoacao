class AddTokenToInstituicao < ActiveRecord::Migration[5.1]
  def change
    add_column :instituicaos, :token, :string
  end
end
