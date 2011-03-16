class Tag < ActiveRecord::Base

	validates_presence_of :nome

	has_and_belongs_to_many :vagas
#	before_save :clean_up

	def clean_up
		self.nome = self.nome.gsub("/","-")
	end
	def to_param
		"#{id}-#{down}"
	end
	
	def down
		nome.gsub("/","-")
	end
	
	def nome_tag
		nome.gsub("_"," ").capitalize
	end
end
