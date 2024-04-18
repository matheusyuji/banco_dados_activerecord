require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Escola.sqlite3"
class Disciplina < ActiveRecord::Base;
  has_and_belongs_to_many :estudantes
  belongs_to :docente

  def self.inserir(atributos)
    disciplina = Disciplina.new({ :nomeDisciplina => atributos[:nomeDisciplina], :codigo => atributos[:codigo], :horario => atributos[:horario], :docente_id => atributos[:docente_id]})
    disciplina.save
    puts "Inserido com sucesso!"
  end

  def self.excluir(atributos)
    if atributos.nil? || atributos.empty?
      disciplinas = Disciplina.all
    else
      disciplinas = Disciplina.where(atributos)
    end 
    disciplinas.each do |disciplina|
      disciplina.delete
    end

    puts "Excluido com sucesso!"
  end

  def self.alterar(atributos)
    begin
      disciplina = Disciplina.find(atributos[:id])
    rescue ActiveRecord::RecordNotFound => e
      puts ("Nao foi encontrado o id da disciplina")
      return
    end

    if(atributos[:docente_id])
      begin
        docente = Docente.find(atributos[:docente_id])
      rescue ActiveRecord::RecordNotFound => e
        puts ("Nao foi encontrado o id do docente")
        return
      end
      disciplina.docente_id = atributos[:docente_id]
    end

    if(atributos[:nomeDisciplina])
      disciplina.nomeDisciplina = atributos[:nomeDisciplina]
    end

    if(atributos[:codigo])
      disciplina.codigo = atributos[:codigo]
    end

    if(atributos[:horario])
      disciplina.horario = atributos[:horario]
    end

    disciplina.save
    puts "Disciplina alterada"
  end

  def mostra()
    puts self.inspect
    puts "\tRelações:"
    puts "\tDocente: #{docente.nome}"
  end

  def self.listar(atributos)
    if atributos.nil? || atributos.empty?
      disciplinas = Disciplina.all
    else
      disciplinas = Disciplina.where(atributos)
    end 

    disciplinas.each do |disciplina|
      disciplina.mostra
    end
  end

end