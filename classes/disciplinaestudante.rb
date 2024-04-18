require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Escola.sqlite3"

class DisciplinaEstudante < ActiveRecord::Base;

  def self.inserir(atributos)
    begin
      estudante = Estudante.find(atributos[:estudante_id])
    rescue ActiveRecord::RecordNotFound => e
      puts ("Nao foi encontrado o id do estudante")
      return
    end

    begin
      disciplina = Disciplina.find(atributos[:disciplina_id])
    rescue ActiveRecord::RecordNotFound => e
      puts ("Nao foi encontrado o id da disciplina")
      return
    end

    disciplinaestudante = DisciplinaEstudante.new ({ :estudante_id => atributos[:estudante_id], :disciplina_id => atributos[:disciplina_id]})
    disciplinaestudante.save
    puts "Inserido com sucesso!"
  end

  def self.excluir(atributos)
    if atributos.nil? || atributos.empty?
      disciplinasEstudantes = DisciplinaEstudante.all
    else
      disciplinasEstudantes = DisciplinaEstudante.where(atributos)
    end 
    disciplinasEstudantes.each do |disciplinaestudante|
      disciplinaestudante.delete
    end
    puts "Excluido com sucesso!"
  end

  def self.alterar(atributos)
    begin
      disciplinaestudante = DisciplinaEstudante.find(atributos[:id])
    rescue ActiveRecord::RecordNotFound => e
      puts ("Nao foi encontrado o id da DisciplinaEstudante")
      return
    end

    if(atributos[:estudante_id])
      begin
        estudante = Estudante.find(atributos[:estudante_id])
      rescue ActiveRecord::RecordNotFound => e
        puts ("Nao foi encontrado o id do estudante")
        return
      end
      disciplinaestudante.estudante_id = atributos[:estudante_id]
    end

    if(atributos[:disciplina_id])
      begin
        disciplina = Disciplina.find(atributosi[:disciplina_id])
      rescue ActiveRecord::RecordNotFound => e
        puts ("Nao foi encontrado o id da disciplina")
        return
      end
      disciplinaestudante.disciplina_id = atributos[:disciplina_id]
    end

    disciplinaestudante.save
    puts "DisciplinaEstudante alterada"

  end

  def mostra()
    puts self.inspect
    puts "Relações:"
    puts "\tEstudante: #{estudante.nome}"
    puts "\tDisciplina: #{disciplina.nomeDisciplina}"

  end

  def self.listar(atributos)
    if atributos.nil? || atributos.empty?
      disciplinasEstudantes = DisciplinaEstudante.all
    else
      disciplinasEstudantes = DisciplinaEstudante.where(atributos)
    end 

    disciplinasEstudantes.each do |disciplinaestudante|
      disciplinaestudante.mostra
    end

  end

end