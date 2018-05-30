class UserMailer < ApplicationMailer
	default from: 'nexti@fapce.edu.br'

	def welcome_email(instituicao)
		@instituicao = instituicao
		@token_url = 'http://localhost:3000/user_registration/' << @instituicao.token
		@url = 'http://example.com/login'
		mail(to: @instituicao.email, subject: 'Welcome to my Awesome Site')
	end
end
