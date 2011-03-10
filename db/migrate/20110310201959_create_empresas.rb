class CreateEmpresas < ActiveRecord::Migration
  def self.up
    create_table :empresas do |t|
      t.string :nome
      t.string :email
      t.string :password_salt
      t.string :password_hash
      t.text :sobre_a_empresa

      t.timestamps
    end
  end

  def self.down
    drop_table :empresas
  end
end
