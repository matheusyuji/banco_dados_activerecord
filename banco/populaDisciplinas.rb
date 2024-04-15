$:.push 'banco/'
$:.push 'classes/'

require 'docente.rb'
require 'disciplina.rb'

disciplina = Disciplina.new({:nomeDisciplina => "Estatística", :codigo => "C721", :horario => "13:30"})
disciplina.docente = Docente.find_by({:nome => "Ricardo Vitor Escobar"})
disciplina.save

disciplina = Disciplina.new({:nomeDisciplina => "Cálculo", :codigo => "C309", :horario => "15:30"})
disciplina.docente = Docente.find_by({:nome => "Bárbara Burgos Rosatto"})
disciplina.save