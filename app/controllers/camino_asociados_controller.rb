class CaminoAsociadosController < ApplicationController
  # GET /camino_asociados
  # GET /camino_asociados.json
  def index
    @camino_asociados = CaminoAsociado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @camino_asociados }
    end
  end

  # GET /camino_asociados/1
  # GET /camino_asociados/1.json
  def show
    @camino_asociado = CaminoAsociado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @camino_asociado }
    end
  end

  # GET /camino_asociados/new
  # GET /camino_asociados/new.json
  def new
    @camino_asociado = CaminoAsociado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @camino_asociado }
    end
  end

  # GET /camino_asociados/1/edit
  def edit
    @camino_asociado = CaminoAsociado.find(params[:id])
  end

  # POST /camino_asociados
  # POST /camino_asociados.json
  def create
    @camino_asociado = CaminoAsociado.new(params[:camino_asociado])

    respond_to do |format|
      if @camino_asociado.save
        format.html { redirect_to @camino_asociado, notice: 'Camino asociado was successfully created.' }
        format.json { render json: @camino_asociado, status: :created, location: @camino_asociado }
      else
        format.html { render action: "new" }
        format.json { render json: @camino_asociado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /camino_asociados/1
  # PUT /camino_asociados/1.json
  def update
    @camino_asociado = CaminoAsociado.find(params[:id])

    respond_to do |format|
      if @camino_asociado.update_attributes(params[:camino_asociado])
        format.html { redirect_to @camino_asociado, notice: 'Camino asociado was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @camino_asociado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camino_asociados/1
  # DELETE /camino_asociados/1.json
  def destroy
    @camino_asociado = CaminoAsociado.find(params[:id])
    @camino_asociado.destroy

    respond_to do |format|
      format.html { redirect_to camino_asociados_url }
      format.json { head :ok }
    end
  end
end
