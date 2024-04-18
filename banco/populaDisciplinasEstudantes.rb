$:.push 'banco/'
$:.push 'classes/'

require 'docente.rb'
require 'disciplina.rb'
require 'estudante.rb'

estudantes = Estudante.all

disciplinas = Disciplina.all

cont = 0
disciplinas.each do |disciplina|
  cont = cont + 1
end

estudantes.each do |estudante|
  for i in 0..4
      estudante.disciplinas << disciplinas[rand(cont)]
  end
end