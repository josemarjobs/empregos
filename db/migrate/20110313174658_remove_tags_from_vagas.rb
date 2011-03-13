class RemoveTagsFromVagas < ActiveRecord::Migration
  def self.up
	remove_column(:vagas, :tags)
  end

  def self.down
	add_column(:vagas, :tags)
  end
end
