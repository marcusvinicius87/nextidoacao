class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def welcome_email(instituicao)
		@instituicao = instituicao
		@url = 'http://example.com/login'
		mail(to: @instituicao.email, subject: 'Welcome to my Awesome Site')
	end
end
