require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Escola.sqlite3"
class Docente < ActiveRecord::Base;
  has_many :disciplinas

  def self.inserir(atributos)
    docente = Docente.new ({ :nome => atributos[:nome]})
    docente.save
    puts ("Inserido com sucesso!")
  end

  def self.excluir(atributos)
    if atributos.nil? || atributos.empty?
      docentes = Docente.all
    else
      docentes = Docente.where(atributos)
    end 
    docentes.each do |docente|
      docente.delete
    end

    puts "Excluido com sucesso!"
  end

  def self.alterar(atributos)
    begin
      docente = Docente.find(atributos[:id])
    rescue ActiveRecord::RecordNotFound => e
      puts ("Nao foi encontrado o id do docente")
      return
    end

    if(atributos[:nome])
      docente.nome = atributos[:nome]
    end

    docente.save
    puts "Docente alterado"
  end

  def mostra()
    puts self.inspect
      puts "\tRelações:"
      puts "\tDisciplinas:"
      if disciplinas.empty?
        puts "\t\tNenhuma disciplina encontrada"
      end
        disciplinas.each do |disciplina|
          puts "\t\t#{disciplina.nomeDisciplina} #{disciplina.codigo} #{disciplina.horario}"
      end
  end

  def self.listar(atributos)
    if atributos.nil? || atributos.empty?
      docentes = Docente.all
    else
      docentes = Docente.where(atributos)
    end 

    docentes.each do |docente|
      docente.mostra
    end
  end

end