class AsociadosController < ApplicationController



  def buscar
    # @asociados = Parse::Query.new("Asociado").tap do |q|
    #     q.value_in("descripcion", ["sadasd"])
    #   end.get
    query = params[:q].split("+")

     @asociados = Array.new
     Asociado.all.each do |a|
        query.each do |q|
        if ((a.descripcion.downcase.include? q.downcase) or (a.nombre.downcase.include? q.downcase))
          if not @asociados.include?(a)
            @asociados.push(a)
          end
        end
      end
     end

    respond_to do |format|
      format.html # buscar.html.erb
      format.json { render json: @asociados }
    end
  
  end

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

    uploaded_file = params[:asociado][:logo]



    photo = Parse::File.new({
                              :body => File.read(uploaded_file.tempfile) ,
                              :local_filename =>  uploaded_file.original_filename,
                              :content_type => uploaded_file.content_type
    })

    photo.save

    model = Parse::Object.new("Asociado").tap do |p|
      p["descripcion"] = @asociado.descripcion
      p["logo"] = photo

      p["categoria"] = @asociado.categoria
      p["direccion"] = @asociado.direccion
      p["email"] = @asociado.email
      p["facebook"] = @asociado.facebook
      p["nombre"] = @asociado.nombre
      p["pinterest"] = @asociado.pinterest
      p["telefono"] = @asociado.telefono
      p["twitter"] = @asociado.twitter
      p["web"] = @asociado.web

    end


    model.save


    redirect_to @asociado

  end

  # PUT /asociados/1
  # PUT /asociados/1.json
  def update
    @asociado = Asociado.find(params[:id])

    @asociado = params[:asociado]
    model = Parse::Query.new("Asociado").eq("objectId", params[:id]).get.first

    if params[:asociado][:logo]
      uploaded_file = params[:asociado][:logo]
      photo = Parse::File.new({
                                :body => File.read(uploaded_file.tempfile) ,
                                :local_filename =>  uploaded_file.original_filename,
                                :content_type => uploaded_file.content_type
      })

      photo.save


    end

    model.tap do |p|

      p["descripcion"] = params[:asociado][:descripcion]
      if photo
        p["logo"] = photo
      end

      p["categoria"] = params[:asociado][:categoria]
      p["direccion"] = params[:asociado][:direccion]
      p["email"] = params[:asociado][:email]
      p["facebook"] = params[:asociado][:facebook]
      p["nombre"] = params[:asociado][:nombre]
      p["pinterest"] = params[:asociado][:pinterest]
      p["telefono"] = params[:asociado][:telefono]
      p["twitter"] = params[:asociado][:twitter]
      p["web"] = params[:asociado][:web]


    end






    model.save


    redirect_to @asociado

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
