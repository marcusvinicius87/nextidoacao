class InstituicaosController < ApplicationController
  before_action :set_instituicao, only: [:show, :edit, :update, :destroy]

  # GET /instituicaos
  # GET /instituicaos.json
  def index
    @instituicaos = Instituicao.all
  end

  # GET /instituicaos/1
  # GET /instituicaos/1.json
  def show
  end

  # GET /instituicaos/new
  def new
    @instituicao = Instituicao.new
    # COMENTÁRIO: O build inicializa a página com 1 nested já renderizado
  end

  # GET /instituicaos/1/edit
  def edit
  end

  # POST /instituicaos
  # POST /instituicaos.json
  def create
    @instituicao = Instituicao.new(instituicao_params)
    respond_to do |format|
      if @instituicao.save
        UserMailer.welcome_email(@instituicao).deliver_later
        format.html { redirect_to @instituicao, notice: 'Instituicao was successfully created.' }
        format.json { render :show, status: :created, location: @instituicao }
      else
        format.html { render :new }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituicaos/1
  # PATCH/PUT /instituicaos/1.json
  def update
    respond_to do |format|
      if @instituicao.update(instituicao_params)
        format.html { redirect_to @instituicao, notice: 'Instituicao was successfully updated.' }
        format.json { render :show, status: :ok, location: @instituicao }
      else
        format.html { render :edit }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instituicaos/1
  # DELETE /instituicaos/1.json
  def destroy
    @instituicao.destroy
    respond_to do |format|
      format.html { redirect_to instituicaos_url, notice: 'Instituicao was successfully destroyed.' }
      format.json { head :no_content }
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
          :codigo_instituicao, :codigo_produto, :logo, :cnpj, :email, telefones_attributes: [:id, :numero, :codigo_area, :tipo],
          enderecos_attributes: [:logradouro, :tipo_logradouro, :numero, :bairro, :cidade, :estado])
    end
end
