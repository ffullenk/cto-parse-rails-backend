class MensajesController < ApplicationController
  # GET /mensajes
  # GET /mensajes.json
  def index
    @mensajes = Mensaje.where(cliente: true).order("createdAt").reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mensajes }
    end
  end

  # GET /mensajes/1
  # GET /mensajes/1.json
  def show
    @mensaje = Mensaje.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mensaje }
    end
  end

  # GET /mensajes/new
  # GET /mensajes/new.json
  def new
    @mensaje = Mensaje.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mensaje }
    end
  end

  # GET /mensajes/1/edit
  def edit
    @mensaje = Mensaje.find(params[:id])
  end
  
  def chat
     mensaje = Mensaje.find(params[:id])
   @mensajes = Mensaje.where(userId: mensaje.userId).order("createdAt").reverse
  end

  def responder_chat
     mensaje = Mensaje.find(params[:id])

    respuesta = Mensaje.new

    respuesta.texto = params[:mensaje][:texto]
    respuesta.cliente = false
    respuesta.userId = params[:mensaje][:userId]
    respuesta.save


    user = User.where(objectId: respuesta.userId).first
  


    # installation_query = Parse::Query.new("_Installation")
    # installation_query.eq("objectId", user.installationId)
    # installation = installation_query.get

    data = { :alert => respuesta.texto }
    push = Parse::Push.new(data, user.objectId)
    push.save



    redirect_to mensajes_chat_path(mensaje)

  end


  # POST /mensajes
  # POST /mensajes.json
  def create
    @mensaje = Mensaje.new(params[:mensaje])
    @mensaje.cliente = false

    userId = @mensaje.userId
    @user = User.where(objectId: :userId)
    @installation = Installation.where(objectId: @user.insta)
    data = { :alert => @mensaje.texto }
    push = Parse::Push.new(data, "mensajes")
    push.save

    respond_to do |format|
      if @mensaje.save
        format.html { redirect_to @mensaje, notice: 'Mensaje was successfully created.' }
        format.json { render json: @mensaje, status: :created, location: @mensaje }
      else
        format.html { render action: "new" }
        format.json { render json: @mensaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mensajes/1
  # PUT /mensajes/1.json
  def update
    @mensaje = Mensaje.find(params[:id])

    respond_to do |format|
      if @mensaje.update_attributes(params[:mensaje])
        format.html { redirect_to @mensaje, notice: 'Mensaje was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mensaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensajes/1
  # DELETE /mensajes/1.json
  def destroy
    @mensaje = Mensaje.find(params[:id])
    @mensaje.destroy

    respond_to do |format|
      format.html { redirect_to mensajes_url }
      format.json { head :ok }
    end
  end
end
