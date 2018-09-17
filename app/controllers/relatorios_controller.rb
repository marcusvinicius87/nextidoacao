class RelatoriosController < ApplicationController

  layout :false
  before_action :authenticate_user!
  before_action :set_relatorio, only: [:show, :edit, :update, :destroy, :download]

  # GET /relatorios
  # GET /relatorios.json
  def index
    @relatorios = current_user.instituicao.relatorios
  end

  # GET /relatorios/1
  # GET /relatorios/1.json
  def show
  end

  # GET /relatorios/new
  def new
    @relatorio = Relatorio.new
  end

  # GET /relatorios/1/edit
  def edit
  end

  # POST /relatorios
  # POST /relatorios.json
  def create
    @relatorio = Relatorio.new(relatorio_params)
    @relatorio.user_id = current_user.id
    @relatorio.instituicao_id = current_user.instituicao.id
    @relatorio.nome_arquivo = current_user.instituicao.nome_arquivo + "." + @relatorio.created_at.to_s + ".SOL"

    respond_to do |format|
      if @relatorio.save
        format.html { redirect_to @relatorio, notice: 'Relatorio was successfully created.' }
        format.json { render :show, status: :created, location: @relatorio }
      else
        format.html { render :new }
        format.json { render json: @relatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relatorios/1
  # PATCH/PUT /relatorios/1.json
  def update
    respond_to do |format|
      if @relatorio.update(relatorio_params)
        format.html { redirect_to @relatorio, notice: 'Relatorio was successfully updated.' }
        format.json { render :show, status: :ok, location: @relatorio }
      else
        format.html { render :edit }
        format.json { render json: @relatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relatorios/1
  # DELETE /relatorios/1.json
  def destroy
    @relatorio.destroy
    respond_to do |format|
      format.html { redirect_to relatorios_url, notice: 'Relatorio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    @relatorio = Relatorio.find(params[:id])
    content = @relatorio.generate_content_file(current_user.instituicao)
    send_data(content, :filename => @relatorio.nome_arquivo)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relatorio
      @relatorio = Relatorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relatorio_params
      params.require(:relatorio).permit(:data_inicio, :data_final, :nome_arquivo, :user_id, :instituicao_id)
    end
end
