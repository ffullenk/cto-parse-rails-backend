class CaminosController < ApplicationController
  # GET /caminos
  # GET /caminos.json
  def index
    @caminos = Camino.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caminos }
    end
  end

  # GET /caminos/1
  # GET /caminos/1.json
  def show
    @camino = Camino.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @camino }
    end
  end

  # GET /caminos/new
  # GET /caminos/new.json
  def new
    @camino = Camino.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @camino }
    end
  end

  # GET /caminos/1/edit
  def edit
    @camino = Camino.find(params[:id])
  end

  # POST /caminos
  # POST /caminos.json
  def create
    @camino = Camino.new(params[:camino])

    uploaded_file_foto = params[:camino][:foto]
    uploaded_file_mapa = params[:camino][:mapa]


      photo = Parse::File.new({
        :body => File.read(uploaded_file_foto.tempfile) ,
        :local_filename =>  uploaded_file_foto.original_filename,
        :content_type => uploaded_file_foto.content_type
      })
    
      photo.save

       mapa = Parse::File.new({
        :body => File.read(uploaded_file_mapa.tempfile) ,
        :local_filename =>  uploaded_file_mapa.original_filename,
        :content_type => uploaded_file_mapa.content_type
      })
    
      mapa.save


    camino = Parse::Object.new("Camino").tap do |p|
        p["nombre"] = params[:camino][:nombre]
        p["descripcion"] = params[:camino][:descripcion]

        p["foto"] = photo
        p["mapa"] = mapa
      end
      

    camino.save
    

    redirect_to caminos_path


  end

  # PUT /caminos/1
  # PUT /caminos/1.json
  def update
    @camino = Camino.find(params[:id])

    respond_to do |format|
      if @camino.update_attributes(params[:camino])
        format.html { redirect_to @camino, notice: 'Camino was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @camino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caminos/1
  # DELETE /caminos/1.json
  def destroy
    @camino = Camino.find(params[:id])
    @camino.destroy

    respond_to do |format|
      format.html { redirect_to caminos_url }
      format.json { head :ok }
    end
  end
end
