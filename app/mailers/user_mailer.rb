class UserMailer < ApplicationMailer
	default from: 'nexti@fapce.edu.br'

	def welcome_email(instituicao)
		@instituicao = instituicao
		@token_url = 'http://nextidoacao.herokuapp.com/user_registration/' << @instituicao.token
		@url = 'http://example.com/login'
		mail(to: @instituicao.email, subject: 'Cadastre o usuário administrador da sua instituicao.')
	end
end
