class UsuariosController < ApplicationController
def new
end

	def create
		@usuario = Usuario.new(:email => params[:email])
		if params[:areas]
			areas = params[:areas]
		else
			areas = [1]
		end
		if @usuario.save
			@usuario.create_areas(areas)
			redirect_to root_url, :notice=>"cadastrado com sucesso"			
		else
			redirect_to root_url, :notice=>@usuario.errors[:email]
		end
	end

end
