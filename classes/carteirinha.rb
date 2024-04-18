require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Escola.sqlite3"
class Carteirinha < ActiveRecord::Base;
  belongs_to :estudante

  def self.inserir(atributos)
    carteirinha = Carteirinha.new({ :numero => atributos[:numero], :estudante_id => atributos[:estudante_id]})
    carteirinha.save
    puts "Inserido com sucesso!"
  end

  def self.excluir(atributos)
    if atributos.nil? || atributos.empty?
      carteirinhas = Carteirinha.all
    else
      carteirinhas = Carteirinha.where(atributos)
    end 
    carteirinhas.each do |carteirinha|
      carteirinha.delete
    end

    puts "Excluido com sucesso!"
  end

  def self.alterar(atributos)
    begin
      carteirinha = Carteirinha.find(atributos[:id])
    rescue ActiveRecord::RecordNotFound => e
      puts ("Nao foi encontrado o id da carteirinha")
      return
    end

    if(atributos[:estudante_id])
      begin
        estudante = Estudante.find(atributos[:estudante_id])
      rescue ActiveRecord::RecordNotFound => e
        puts ("Nao foi encontrado o id do estudante")
        return
      end
      carteirinha.estudante_id = atributos[:estudante_id]
    end

    if(atributos[:numero])
      carteirinha.numero = atributos[:numero]
    end

    carteirinha.save
  end

  def mostra()
    puts self.inspect
    puts "\tRelações:"
    puts "\tEstudante: #{estudante.nome}"
  end

  def self.listar(atributos)
    if atributos.nil? || atributos.empty?
      carteirinhas = Carteirinha.all
    else
      carteirinhas = Carteirinha.where(atributos)
    end 

    carteirinhas.each do |carteirinha|
      carteirinha.mostra
    end

  end

end