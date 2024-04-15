require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Escola.sqlite3"

ActiveRecord::Base.connection.create_table :disciplinas do |t|
  t.string :nomeDisciplina
  t.string :codigo
  t.string :horario
  t.references :docente,foreign_key:true
end