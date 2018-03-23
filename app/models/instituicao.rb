class Instituicao < ApplicationRecord
	
	has_many :telefones, :dependent => :destroy
	has_many :enderecos, :dependent => :destroy

	accepts_nested_attributes_for :telefones, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :enderecos, reject_if: :all_blank, allow_destroy: true

end
