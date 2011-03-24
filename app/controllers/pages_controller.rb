class PagesController < ApplicationController
	respond_to :html, :xml

	def home
		@vagas = Vaga.order("created_at DESC").limit(5)
	end

	def search
	#Product.where({:price.lt => 5} | {:name.matches => "%video%"})
	#Product.order(:released_at.desc)
	#Vaga.search("java").joins(:tags).where('tags.nome LIKE ?', "java")
	#Vaga.search(params[:term]).order("created_at DESC").page(params[:page]).per(12)

		@vagas = Vaga.search(params[:term]).order("created_at DESC").page(params[:page]).per(12)
		respond_with @vagas
	end
end
