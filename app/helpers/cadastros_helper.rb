module CadastrosHelper

	def post_date(data)
		data.strftime("%d/%m/%Y")
	end

end
