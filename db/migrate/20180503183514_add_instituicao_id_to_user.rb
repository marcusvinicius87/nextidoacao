class AddInstituicaoIdToUser < ActiveRecord::Migration[5.1]
  def change
  	add_reference :users, :instituicao, foreign_key: true
  end
end
