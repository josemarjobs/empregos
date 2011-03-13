class CreateTagsVagasJoinTable < ActiveRecord::Migration
	def self.up
    create_table :tags_vagas, :id => false do |t|
      t.integer :tag_id
      t.integer :vaga_id
    end
  end

  def self.down
    drop_table :tags_vagas
  end
end
