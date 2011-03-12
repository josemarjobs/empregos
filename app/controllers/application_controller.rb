class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :current_user, :can_edit_dados

	private

	def current_user
	  @current_user ||= Empresa.find(session[:user_id]) if session[:user_id]
	end

	def can_edit_dados(id)
		current_user.id == id if current_user
	end	

end
