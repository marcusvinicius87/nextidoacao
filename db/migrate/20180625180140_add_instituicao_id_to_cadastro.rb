class AddInstituicaoIdToCadastro < ActiveRecord::Migration[5.1]
  def change
  	add_reference :cadastros, :instituicao, foreign_key: true
  end
end
