$:.push 'banco/'
$:.push 'classes/'

require 'carteirinha.rb'
require 'disciplina.rb'
require 'docente.rb'
require 'estudante.rb'

# Cria a tabela hash com os atributos
def cria_tabela_hash(dados)
  tabela_hash = {}
  ex = /(\w+)=("(?:\\.|[^"\\])*"|\S+)/
  dados.scan(ex) do |chave, valor|
    valor.gsub!(/^"(.*)"$/, '\1') 
    tabela_hash[chave.to_sym] = valor
  end
  tabela_hash
end

# Escolhe em qual tabela vai ser a alteracao
def alteracao(tabela, tabela_atributos)
  case tabela
  when "carteirinhas"
    Carteirinha.alterar(tabela_atributos)
  when "disciplinas"
    Disciplina.alterar(tabela_atributos)
  when "docentes"
    Docente.alterar(tabela_atributos)
  when "estudantes"
    Estudante.alterar(tabela_atributos)
  else
    puts "A tabela nao existe"
  end
end

# Escolhe em qual tabela vai ser a exclusao
def exclusao(tabela, tabela_atributos)
  case tabela
  when "carteirinhas"
    Carteirinha.excluir(tabela_atributos)
  when "disciplinas"
    Disciplina.excluir(tabela_atributos)
  when "docentes"
    Docente.excluir(tabela_atributos)
  when "estudantes"
    Estudante.excluir(tabela_atributos)
  else
    puts "A tabela nao existe"
  end
end

# Escolhe em qual tabela vai ser a inclusao
def inclusao(tabela, tabela_atributos)
  case tabela
  when "carteirinhas"
    Carteirinha.inserir(tabela_atributos)
  when "disciplinas"
    Disciplina.inserir(tabela_atributos)
  when "docentes"
    Docente.inserir(tabela_atributos)
  when "estudantes"
    Estudante.inserir(tabela_atributos)
  else
    puts "A tabela nao existe"
  end
end

# Escolhe qual tabela vai ser listada
def lista(tabela, tabela_atributos)
  case tabela
  when "carteirinhas"
    Carteirinha.listar(tabela_atributos)
  when "disciplinas"
    Disciplina.listar(tabela_atributos)
  when "docentes"
    Docente.listar(tabela_atributos)
  when "estudantes"
    Estudante.listar(tabela_atributos)
  else
    puts "A tabela nao existe"
  end
end

puts "Siga o seguinte comando <operacao> <tabela> {atributo=valor}"
puts "Operacoes: alteracao, exclusao, inclusao e lista"
puts "Tabelas: carteirinhas, disciplinas, docentes e estudantes"
puts "Exemplo de operacao valida: "
puts "Para encerrar o programa digite quit"

loop do 
  entrada = gets.chomp

  if !(entrada.nil? || entrada.empty?)
    div = entrada.split(" ", 2)
    operacao = div[0]
    dados = div[1]
  end

  if !(dados.nil? || dados.empty?)
    div = dados.split(" ", 2)
    tabela = div[0]
    dados = div[1]
  end

  if !(dados.nil? || dados.empty?)
    tabela_atributos = cria_tabela_hash(dados)
  end

  case operacao
  when "alteracao"
    alteracao(tabela, tabela_atributos)
  when "exclusao"
    exclusao(tabela, tabela_atributos)
  when "inclusao"
    inclusao(tabela, tabela_atributos)
  when "lista"
    lista(tabela, tabela_atributos)
  when "quit"
    return
  else 
    puts "Operacao invalida"
  end
end 