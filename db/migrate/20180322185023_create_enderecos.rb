class CreateEnderecos < ActiveRecord::Migration[5.1]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :tipo_logradouro
      t.string :numero
      t.string :bairro
      t.string :cidade
      t.string :estado

      t.timestamps
    end
  end
end
