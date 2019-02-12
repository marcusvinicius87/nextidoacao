class TelefonesController < ApplicationController
  
  before_action :set_telefone, except: [:all]

  def index
    @telefones = Telefone.all
  end

  def show
  end

  def new
    @telefone = Telefone.new
  end

  def edit; end

  def create
    @telefone = Telefone.new(telefone_params)

    respond_to do |format|
      if @telefone.save
        format.html { redirect_to @telefone, notice: 'Telefone was successfully created.' }
        format.json { render :show, status: :created, location: @telefone }
      else
        format.html { render :new }
        format.json { render json: @telefone.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @telefone.update(telefone_params)
        format.html { redirect_to @telefone, notice: 'Telefone was successfully updated.' }
        format.json { render :show, status: :ok, location: @telefone }
      else
        format.html { render :edit }
        format.json { render json: @telefone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @telefone.destroy
    respond_to do |format|
      format.html { redirect_to telefones_url, notice: 'Telefone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_telefone
      @telefone = Telefone.find(params[:id])
    end

    def telefone_params
      params.require(:telefone).permit(:instituicao_id, :codigo_area, :numero, :tipo)
    end
end
