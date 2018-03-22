class CreateInstituicaos < ActiveRecord::Migration[5.1]
  def change
    create_table :instituicaos do |t|
      t.string :nome_instituicao
      t.string :nome_relatorio_instituicao
      t.string :codigo_instituicao
      t.string :codigo_produto
      t.string :logo
      t.string :cnpj

      t.timestamps
    end
  end
end
