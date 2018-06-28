class FabricaUser
	
	def cria_usuario_admin(user, token)
		@instituicao = Instituicao.find_by token: (token)

		user.ativo = false
		user.instituicao_id = @instituicao.id
		user.email = @instituicao.email

		if user.save!
			@instituicao.token = ""
			@instituicao.save!
		end
	end

	def cria_usuario_colaborador

	end

end