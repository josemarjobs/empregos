class CreateVagas < ActiveRecord::Migration
  def self.up
    create_table :vagas do |t|
      t.string :vaga
      t.string :como_se_candidatar
      t.string :contato
      t.float :salario_min
      t.float :salario_max
      t.integer :empresa_id
      t.string :cidade
      t.integer :perfil_id
      t.string :pre_requisitos
      t.string :tags
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :vagas
  end
end
