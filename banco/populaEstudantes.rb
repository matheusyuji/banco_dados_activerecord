$:.push 'banco/'
$:.push 'classes/'

require 'estudante.rb'

estudante = Estudante.new ({ :nome => "Simão Campos Prado", :dataNascimento => "20/04/1993"})
estudante.save
estudante = Estudante.new ({ :nome => "Alberto Galindo Pontes", :dataNascimento => "14/11/1991"})
estudante.save
estudante = Estudante.new ({ :nome => "Rosana Tainá Colaço", :dataNascimento => "05/02/2005"})
estudante.save
estudante = Estudante.new ({ :nome => "Manuela Luzinete de Matos", :dataNascimento => "07/07/2002"})
estudante.save
estudante = Estudante.new ({ :nome => "Nair Sabrina Guerra", :dataNascimento => "04/09/1997"})
estudante.save