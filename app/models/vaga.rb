class Vaga < ActiveRecord::Base
	
	scope :vagas, 
	lambda {|perfil, empresa| where("perfil_id = ? AND empresa_id = ?", perfil, empresa) }
	
	belongs_to :perfil
	belongs_to :empresa
	has_and_belongs_to_many :tags

	def to_param
		"#{id}-#{down}"
	end

	def down
		vaga.downcase.gsub(" ","_")
	end

	def vaga_curta
		v=[]
		if descricao.length > 200
			for i in(0..200)
				v<< descricao[i].chr
			end
				v<< '...'
			return v.join()
		else
			return descricao
		end
		
	end

	def create_tags(tag_array)
		tag_array.each do |tag|
			tags<< Tag.find_or_create_by_nome(:nome=>tag)
		end
	end

end
