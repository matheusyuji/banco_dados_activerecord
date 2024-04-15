$:.push 'banco/'
$:.push 'classes/'

require 'docente.rb'

docente = Docente.new ({ :nome => "Ricardo Vitor Escobar"})
docente.save
docente = Docente.new ({ :nome => "Antônio Edinaldo Abreu"})
docente.save
docente = Docente.new ({ :nome => "Elizabeth Abreu de Flores"})
docente.save
docente = Docente.new ({ :nome => "Bárbara Burgos Rosatto"})
docente.save
docente = Docente.new ({ :nome => "Fátima Esteves dos Santos"})
docente.save