class AddEmailToInstituicao < ActiveRecord::Migration[5.1]
  def change
    add_column :instituicaos, :email, :string
  end
end
