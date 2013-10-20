class Asociado < ParseResource::Base
  field :facebook
  field :twitter
  field :pinterest
  field :nombre
  field :logo
  field :descripcion
  field :telefono
  field :direccion
  field :web
  field :email
  field :categoria
  field :tipo

   def class_name
    self.class.name
  end
end
