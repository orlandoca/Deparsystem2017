class RecibosController < ApplicationController
  before_action :set_recibo, only: [:show, :edit, :update, :destroy]

  # GET /recibos
  # GET /recibos.json
  def index
    @recibos = Recibo.all
  end

  # GET /recibos/1
  # GET /recibos/1.json
  def show
  end

  # GET /recibos/new
  def new
    @recibo = Recibo.new
  end

  # GET /recibos/1/edit
  def edit
  end

  # POST /recibos
  # POST /recibos.json
  def create
    @recibo = Recibo.new(recibo_params)

    respond_to do |format|
      if @recibo.save
        format.html { redirect_to @recibo, notice: 'Recibo was successfully created.' }
        format.json { render :show, status: :created, location: @recibo }
      else
        format.html { render :new }
        format.json { render json: @recibo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recibos/1
  # PATCH/PUT /recibos/1.json
  def update
    respond_to do |format|
      if @recibo.update(recibo_params)
        format.html { redirect_to @recibo, notice: 'Recibo was successfully updated.' }
        format.json { render :show, status: :ok, location: @recibo }
      else
        format.html { render :edit }
        format.json { render json: @recibo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recibos/1
  # DELETE /recibos/1.json
  def destroy
    @recibo.destroy
    respond_to do |format|
      format.html { redirect_to recibos_url, notice: 'Recibo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recibo
      @recibo = Recibo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recibo_params
      params.require(:recibo).permit(:contrato_id, :fecha)
    end
end
