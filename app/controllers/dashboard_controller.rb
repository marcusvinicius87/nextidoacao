class DashboardController < ApplicationController
	layout false
	before_action :authenticate_user!

	def index
		@instituicao = current_user.instituicao
		@cadastros_dia = current_user.instituicao.cadastros.where('extract(day from created_at) = ?', Date.today.day).size
		@cadastros_mes = current_user.instituicao.cadastros.select('valor').where('extract(month from data_ocorrencia) = ? AND extract(year from data_ocorrencia) = ? AND doador_ativo = ?', Date.today.month, Date.today.year, true)
		
		@ultimos_cadastros = current_user.instituicao.cadastros.last(5)
		@arrecadado = get_arrecadado(@cadastros_mes)
		@percentual = (@cadastros_dia * 100) / 50
		@percentual_liquido = (@arrecadado * 100) / 1000
	end

	def get_cadastros_mes
		meses = []
		data = current_user.instituicao.cadastros

		(1..12).each { |mes| meses << data.select("data_ocorrencia").where('extract(month from data_ocorrencia) = ? AND extract(year from data_ocorrencia) = ?', mes, Date.today.year).size }
		
		render json: {janeiro: meses[0], fevereiro: meses[1], marco: meses[2], abril: meses[3], maio: meses[4], 
					junho: meses[5], julho: meses[6], agosto: meses[7], setembro: meses[8], outubro: meses[9], novembro: meses[10], dezembro: meses[11]}, status: :ok
	end

	def get_cadastros_semana
		dias = []
		data = current_user.instituicao.cadastros.select("data_ocorrencia").where('data_ocorrencia between ? and ?', Date.today.beginning_of_week, Date.today.end_of_week)

		(0..6).each { |dia| dias << data.where('extract(dow from data_ocorrencia) = ?', dia).size}

		render json: {domingo: dias[0], segunda: dias[1], terca: dias[2], quarta: dias[3], quinta: dias[4], 
					sexta: dias[5], sabado: dias[6]}, status: :ok
	end

	def get_arrecadado (values)
		arrecadado = 0
		values.each { |cadastro| arrecadado += cadastro.valor }
		return arrecadado
	end
end
