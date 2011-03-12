class PagesController < ApplicationController
	def home
		@vagas = Vaga.order("created_at DESC").limit(5)
	end
end
