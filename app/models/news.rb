class News < ParseResource::Base
  field :resumen
  field :texto
  field :foto
  field :tipo

   def class_name
    self.class.name
  end
end
