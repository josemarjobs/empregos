class SessionsController < ApplicationController

  def new
	@empresa = Empresa.new
  end

	def create_anunciar
	  responsavel = Empresa.authenticate(params[:email], params[:password])
	  if responsavel
		 session[:user_id] = responsavel.id
			redirect(params[:from],"Logado!!!")
	  else
			redirect(params[:from],"E-mailo ou password incorreto, pf verifique!")
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end

	private
	def redirect(from, msg)
		 if from == "anunciar"
			 redirect_to anunciar_url, :notice => msg
		 else
			 redirect_to root_url
		 end
	end

end
