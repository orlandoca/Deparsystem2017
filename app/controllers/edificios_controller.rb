class EdificiosController < ApplicationController
  before_action :set_edificio, only: [:show, :edit, :update, :destroy]

  # GET /edificios
  # GET /edificios.json

  def index
    cajaabierto = Caja.where(estado:0)
    if (cajaabierto.count > 0)
      @edificios = Edificio.all
    else
      redirect_to new_caja_path
    end
  end

  # GET /edificios/1
  # GET /edificios/1.json
  def show
  end

  # GET /edificios/new
  def new
    @edificio = Edificio.new
  end

  # GET /edificios/1/edit
  def edit
  end

  # POST /edificios
  # POST /edificios.json
  def create
    @edificio = Edificio.new(edificio_params)

    respond_to do |format|
      if @edificio.save
        format.html { redirect_to @edificio, notice: 'Edificio creado exitosamente.' }
        format.json { render :show, status: :created, location: @edificio }
      else
        format.html { render :new }
        format.json { render json: @edificio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edificios/1
  # PATCH/PUT /edificios/1.json
  def update
    respond_to do |format|
      if @edificio.update(edificio_params)
        format.html { redirect_to @edificio, notice: 'Edificio actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @edificio }
      else
        format.html { render :edit }
        format.json { render json: @edificio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edificios/1
  # DELETE /edificios/1.json
  def destroy
    @edificio.destroy
    respond_to do |format|
      format.html { redirect_to edificios_url, notice: 'Edificio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edificio
      @edificio = Edificio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edificio_params
      params.require(:edificio).permit(:nombre_edificio, :nombre_propietario, :direccion, departamentos_attributes: [ :id, :nombre_departamento, :precio, :descripcion, :estado, :_destroy ])
    end
end
