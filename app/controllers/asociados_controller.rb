class AsociadosController < ApplicationController
  # GET /asociados
  # GET /asociados.json
  def index
    @asociados = Asociado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asociados }
    end
  end

  # GET /asociados/1
  # GET /asociados/1.json
  def show
    @asociado = Asociado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asociado }
    end
  end

  # GET /asociados/new
  # GET /asociados/new.json
  def new
    @asociado = Asociado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asociado }
    end
  end

  # GET /asociados/1/edit
  def edit
    @asociado = Asociado.find(params[:id])
  end

  # POST /asociados
  # POST /asociados.json
  def create
    @asociado = Asociado.new(params[:asociado])

    respond_to do |format|
      if @asociado.save
        format.html { redirect_to @asociado, notice: 'Asociado was successfully created.' }
        format.json { render json: @asociado, status: :created, location: @asociado }
      else
        format.html { render action: "new" }
        format.json { render json: @asociado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /asociados/1
  # PUT /asociados/1.json
  def update
    @asociado = Asociado.find(params[:id])

    respond_to do |format|
      if @asociado.update_attributes(params[:asociado])
        format.html { redirect_to @asociado, notice: 'Asociado was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @asociado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asociados/1
  # DELETE /asociados/1.json
  def destroy
    @asociado = Asociado.find(params[:id])
    @asociado.destroy

    respond_to do |format|
      format.html { redirect_to asociados_url }
      format.json { head :ok }
    end
  end
end
