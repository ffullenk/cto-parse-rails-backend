class FotosController < ApplicationController
  require 'open-uri'
  # GET /fotos
  # GET /fotos.json
  def index
    @fotos = Foto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fotos }
    end
  end

  # GET /fotos/1
  # GET /fotos/1.json
  def show
    @foto = Foto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foto }
    end
  end

  # GET /fotos/new
  # GET /fotos/new.json
  def new
    @foto = Foto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foto }
    end
  end

  # GET /fotos/1/edit
  def edit
    @foto = Foto.find(params[:id])
  end

  # POST /fotos
  # POST /fotos.json
  def create
    

    @foto = Foto.new(params[:foto])
    uploaded_file = params[:foto][:foto]
    


      photo = Parse::File.new({
        :body => File.read(uploaded_file.tempfile) ,
        :local_filename =>  uploaded_file.original_filename,
        :content_type => uploaded_file.content_type
      })
    
      photo.save
    foto = Parse::Object.new("Foto").tap do |p|
        p["foto"] = photo
        p["descripcion"] = params[:foto][:descripcion]
        p["categoryId"] = params[:foto][:categoryId]
      end
      

    foto.save
    

    redirect_to @foto
  end

  # PUT /fotos/1
  # PUT /fotos/1.json
  def update
    @foto = Foto.find(params[:id])

    respond_to do |format|
      if @foto.update_attributes(params[:foto])
        format.html { redirect_to @foto, notice: 'Foto was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fotos/1
  # DELETE /fotos/1.json
  def destroy
    @foto = Foto.find(params[:id])
    @foto.destroy

    respond_to do |format|
      format.html { redirect_to fotos_url }
      format.json { head :ok }
    end
  end
end
