class AddInstituicaoIdToEndereco < ActiveRecord::Migration[5.1]
  def change
  	add_reference :enderecos, :instituicao, foreign_key: true
  end
end
