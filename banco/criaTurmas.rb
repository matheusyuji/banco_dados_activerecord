require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Escola.sqlite3"

ActiveRecord::Base.connection.create_table :turmas do |t|
  t.string:nome
  t.references:estudante, foreign_key:true
  t.references:professor, foreign_key:true
end