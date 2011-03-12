class Perfil < ActiveRecord::Base
	has_many :vagas
	
	def to_param
		"#{id}-#{down}"
	end
	def down
		nome.downcase.gsub(" ","_")
	end
end
