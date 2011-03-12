class Vaga < ActiveRecord::Base
	
	scope :vagas, 
	lambda {|perfil, empresa| where("perfil_id = ? AND empresa_id = ?", perfil, empresa) }
	
	belongs_to :perfil
	belongs_to :empresa

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
end
