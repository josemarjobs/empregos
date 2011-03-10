class Vaga < ActiveRecord::Base

	belongs_to :perfil

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
