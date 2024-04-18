require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Escola.sqlite3"
class Estudante < ActiveRecord::Base;
  has_and_belongs_to_many :disciplinas, -> { distinct }, dependent: :destroy
  has_one :carteirinha, dependent: :destroy

  def self.inserir(atributos)
    estudante = Estudante.new ({ :nome => atributos[:nome], :dataNascimento => atributos[:dataNascimento]})
    estudante.save
    puts "Done"
  end

  def self.excluir(atributos)
    if atributos.nil? || atributos.empty?
      estudantes = Estudante.all
    else
      estudantes = Estudante.where(atributos)
    end 
    estudantes.each do |estudante|
      estudante.delete
    end
  end

  def self.alterar(atributos)
    begin
      estudante = Estudante.find(atributos[:id])
    rescue ActiveRecord::RecordNotFound => e
      puts ("Nao foi encontrado o id do estudante")
      return
    end

    if(atributos[:nome])
      estudante.nome = atributos[:nome]
    end

    if(atributos[:dataNascimento])
      estudante.dataNascimento = atributos[:dataNascimento]
    end

    estudante.save
    puts "Estudante alterado"
  end

  def mostra()
    puts self.inspect
    puts "\t::Relações::"
    if (carteirinha.nil?)
      puts "\tNenhuma carteirinha encontrada"
    else
      puts "\tCarteirinha: #{carteirinha.numero}"
    end
    puts "\tDisciplinas:"
    if disciplinas.empty?
      puts "\t\tNenhuma disciplina encontrada"
    end
    disciplinas.each do |disciplina|
      puts "\t\t#{disciplina.docente.nome} #{disciplina.nomeDisciplina} #{disciplina.codigo} #{disciplina.horario}"
    end

  end
  def self.listar(atributos)
    if atributos.nil? || atributos.empty?
      estudantes = Estudante.all
    else
      estudantes = Estudante.where(atributos)
    end 

    estudantes.each do |estudante|
      estudante.mostra
    end
  end

end