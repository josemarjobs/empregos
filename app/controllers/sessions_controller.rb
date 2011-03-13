class SessionsController < ApplicationController

  def new
	@empresa = Empresa.new
  end

	def create_anunciar
	  responsavel = Empresa.authenticate(params[:email], params[:password])
	  if responsavel
		 session[:user_id] = responsavel.id
			redirect_ok(params[:from],"Logado!!!")
	  else
			redirect_falha(params[:from],"E-mailo ou password incorreto, pf verifique!")
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end

	private
	def redirect_ok(from, msg)
		 if from == "anunciar"
			 redirect_to anunciar_url, :notice => msg
		 else
			 redirect_to root_url
		 end
	end

	def redirect_falha(from, msg)
		 if from == "anunciar"
			 redirect_to anunciar_url, :notice => msg
		 else
			 redirect_to log_in_url, :notice=>msg
		 end
	end
end
