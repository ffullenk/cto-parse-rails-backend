class Foto < ParseResource::Base
  field :foto
  field :descripcion
  field :categoryId
  field :tipo
  
   def class_name
    self.class.name
  end
  

end
