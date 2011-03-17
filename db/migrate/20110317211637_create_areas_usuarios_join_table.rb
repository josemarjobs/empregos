class CreateAreasUsuariosJoinTable < ActiveRecord::Migration
	def self.up
	 create_table :areas_usuarios, :id => false do |t|
		t.integer :area_id
		t.integer :usuario_id
	 end
	end

	def self.down
	 drop_table :areas_usuarios
	end

end
