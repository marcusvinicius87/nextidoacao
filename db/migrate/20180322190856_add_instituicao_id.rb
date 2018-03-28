class AddInstituicaoId < ActiveRecord::Migration[5.1]
  def change
	add_reference :telefones, :instituicao, foreign_key: true
  end
end
