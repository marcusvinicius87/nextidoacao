class Instituicao < ApplicationRecord
	
	has_many :telefones, :dependent => :destroy
	has_many :enderecos, :dependent => :destroy

	accepts_nested_attributes_for :telefones,  allow_destroy: true
	accepts_nested_attributes_for :enderecos, reject_if: :all_blank, allow_destroy: true

	validates_presence_of :nome_instituicao, :nome_relatorio_instituicao, :codigo_instituicao
	validates_length_of :nome_relatorio_instituicao, :maximum => 20, :minimum => 20, :allow_blank => true

end
