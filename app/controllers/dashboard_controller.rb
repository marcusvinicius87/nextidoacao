class DashboardController < ApplicationController
	layout false
	before_action :authenticate_user!

	def index
		@instituicao = current_user.instituicao
	end

	def get_cadastros
		janeiro = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 1) .size
		fevereiro = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 2).size
		marco = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 3).size
		abril = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 4).size
		maio = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 5).size
		junho = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 6).size
		julho = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 7).size
		agosto = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 8).size
		setembro = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 9).size
		outubro = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 10).size
		novembro = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 11).size
		dezembro = current_user.instituicao.cadastros.where('extract(month from data_ocorrencia) = ?', 12).size
		render json: {janeiro: janeiro, fevereiro: fevereiro, marco: marco, abril: abril, maio: maio, 
					junho: junho, julho: julho, agosto: agosto, setembro: setembro, outubro: outubro, novembro: novembro, dezembro: dezembro}, status: :ok
	end
end
