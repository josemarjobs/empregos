class AddNomeEmpresaToEmpresas < ActiveRecord::Migration
  def self.up
    add_column :empresas, :nome_empresa, :string
  end

  def self.down
    remove_column :empresas, :nome_empresa
  end
end
