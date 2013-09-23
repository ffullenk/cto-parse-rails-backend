class HomeController < ApplicationController
	layout "buscar"

	def buscar


	query = params[:q].split("+")

     @news = Array.new
     News.all.each do |a|
        query.each do |q|
        if (a.texto.downcase.include? q.downcase) or (a.resumen.downcase.include? q.downcase)
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

     @fotos = Array.new
     Foto.all.each do |a|
        query.each do |q|
        if (a.descripcion.downcase.include? q.downcase)
          if not @fotos.include?(a)
            @fotos.push(a)
          end
        end
      end
     end


     if ((@fotos.count.eql? 0) or (@asociados.count.eql? 0) or (@news.count.eql? 0))
      @noresultados = true
    else
      @noresultados = false
    end




	
	end

end
