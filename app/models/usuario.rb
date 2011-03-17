class Usuario < ActiveRecord::Base
	validates_presence_of :email, :message=>" - o email é obrigatório"	
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
								:message => " - email incorrecto"

	
	has_and_belongs_to_many :areas

	
	def create_areas(areas)
		areas.each do |area|
			self.areas<< Area.find(area)
		end
	end
end
