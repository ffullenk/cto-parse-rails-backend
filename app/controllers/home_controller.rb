class HomeController < ApplicationController
	layout false

	def buscar


	query = params[:q].split("+")

     @news = Array.new
     News.all.each do |a|
        query.each do |q|
        if (a.texto.downcase.include? q.downcase)
          if not @news.include?(a)
            @news.push(a)
          end
        end
      end
     end

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




	
	end

end
