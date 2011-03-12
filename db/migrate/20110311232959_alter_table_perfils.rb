class AlterTablePerfils < ActiveRecord::Migration
  def self.up
	rename_table(:perfils, :perfis) 
  end

  def self.down
  end
end
