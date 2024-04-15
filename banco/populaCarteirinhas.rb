$:.push 'banco/'
$:.push 'classes/'

require 'estudante.rb'
require 'carteirinha.rb'

estudante1 = Estudante.find_by({ :nome => "Simão Campos Prado"})
estudante2 = Estudante.find_by({ :nome => "Alberto Galindo Pontes"})
estudante3 = Estudante.find_by({ :nome => "Rosana Tainá Colaço"})
estudante4 = Estudante.find_by({ :nome => "Manuela Luzinete de Matos"})
estudante5 = Estudante.find_by({ :nome => "Nair Sabrina Guerra"})

carteirinha = Carteirinha.new({ :numero => "7936", :estudante => estudante1})
carteirinha.save
carteirinha = Carteirinha.new({ :numero => "4281", :estudante => estudante2})
carteirinha.save
carteirinha = Carteirinha.new({ :numero => "8716", :estudante => estudante3})
carteirinha.save
carteirinha = Carteirinha.new({ :numero => "6383", :estudante => estudante4})
carteirinha.save
carteirinha = Carteirinha.new({ :numero => "4553", :estudante => estudante5})
carteirinha.save