# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
[
	{:nome=>"Todos"},
	{:nome=>"Profissional"},
	{:nome=>"Estagiario"},
	{:nome=>"Deficiente fisico"},
].each do|p|
	Perfil.find_or_create_by_nome(p)
end



