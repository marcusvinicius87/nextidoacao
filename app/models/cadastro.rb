class Cadastro < ApplicationRecord
	belongs_to :user
	belongs_to :instituicao

	validates_presence_of :id_cliente_enel, :digito_verificador_cliente_enel, :codigo_ocorrencia, :valor, :parcelas
	validates :id_cliente_enel, length: { maximum: 10, too_long: "é maior que o aceitável de 10 digitos. Verifique e tente novamente." }
	validates :digito_verificador_cliente_enel, length: { maximum: 2, too_long: "é maior que o aceitável de 2 digitos. Verifique e tente novamente." }
	validates :codigo_ocorrencia, length: { maximum: 2, too_long: "é maior que o aceitável de 2 digitos. Verifique e tente novamente." }
	validates :parcelas, length: { maximum: 2, too_long: "é maior que o aceitável de 2 digitos. Verifique e tente novamente." }

end
