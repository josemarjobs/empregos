class Vaga < ActiveRecord::Base

 #      t.string :vaga
 #      t.string :como_se_candidatar
 #      t.string :contato
 #      t.float :salario_min
 #      t.float :salario_max
 #      t.integer :empresa_id
 #      t.string :cidade
 #      t.integer :perfil_id
 #      t.string :pre_requisitos
 #      t.string :tags
 #      t.text :descricao	

	validates_presence_of :vaga, :message => "O Nome não pode ficar vazio"
	validates_numericality_of :salario_min, :message => "Os salários precisam ser Números"
	validates_numericality_of :salario_max, :message => "Os salários precisam ser Números"
	validates_presence_of :contato, :message => "O Contato não pode ficar vazio"
	validates_presence_of :descricao, :message => "Precisa adicionar uma descrição"

	validate :salarios

	scope :vagas, 
	lambda {|perfil, empresa| where("perfil_id = ? AND empresa_id = ?", perfil, empresa) }
	
	belongs_to :perfil
	belongs_to :empresa
	has_and_belongs_to_many :tags

	def self.search(search)
	  if search
		 where("vaga LIKE ? OR vaga LIKE ? OR vaga LIKE ? OR vaga LIKE ?", "%#{search}%", "%#{search.downcase}%", "%#{search.capitalize}%", "%#{search.upcase}%")
		 
	  else
		 scoped
	  end
	end


	#before_save :clean_up

	def clean_up
		self.vaga = self.vaga.gsub("/","-")
	end

	def to_param
		"#{id}-#{down}"
	end

	def down
		vaga.downcase.gsub(" ","_").gsub("/","-")
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

#Validadores
	def salarios
		if salario_min && salario_max
		errors.add("salarios", "O salario Mínimo deve ser menor que o Máximo") if salario_min > salario_max
		end
	end

end
