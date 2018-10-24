class InstituicaosController < ApplicationController
  
  before_action :set_instituicao, only: [:show, :edit, :update, :destroy]

  # GET /instituicaos/new
  def new
    @instituicao = Instituicao.new
    # COMENTÁRIO: O build inicializa a página com 1 nested já renderizado
  end

  # POST /instituicaos
  # POST /instituicaos.json
  def create
    @instituicao = Instituicao.new(instituicao_params)
    respond_to do |format|
      if @instituicao.save
        format.html { redirect_to email_validation_path, notice: 'Instituicao was successfully created.' }
        format.json { render :show, status: :created, location: @instituicao }
        UserMailer.welcome_email(@instituicao).deliver_later
      else
        format.html { render :new }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instituicao
      @instituicao = Instituicao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instituicao_params
      params.require(:instituicao).permit(:nome_instituicao, :nome_relatorio_instituicao, 
        :codigo_instituicao, :codigo_produto, :logo, :cnpj, :email, :nome_arquivo, telefones_attributes: [:id, :numero, :codigo_area, :tipo],
        enderecos_attributes: [:logradouro, :tipo_logradouro, :numero, :bairro, :cidade, :estado])
    end
  end
