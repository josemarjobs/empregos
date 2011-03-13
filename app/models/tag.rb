class Tag < ActiveRecord::Base

	validates_presence_of :nome

	has_and_belongs_to_many :vagas

	def to_param
		"#{id}-#{nome}"
	end

	def nome_tag
		nome.gsub("_"," ").capitalize
	end
end
