require 'rubygems' 
require 'active_record' 
 
ActiveRecord::Base.establish_connection :adapter => "sqlite3", 
                                        :database => "Escola.sqlite3" 
 
ActiveRecord::Base.connection.create_table :disciplinas_estudantes do |t|  
    t.references:estudante,foreign_key:true
    t.references:disciplina,foreign_key:true
end 
