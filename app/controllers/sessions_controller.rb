class SessionsController < ApplicationController

  def new
  end

	def create_anunciar
	  responsavel = Empresa.authenticate(params[:email], params[:password])
	  if responsavel
		 session[:user_id] = responsavel.id
		 redirect_to anunciar_url, :notice => "Loggado!"
	  else
		 redirect_to anunciar_url, :notice => "E-mailo ou password incorreto, pf verifique!"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end

end
