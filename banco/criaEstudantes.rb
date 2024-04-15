require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Escola.sqlite3"

ActiveRecord::Base.connection.create_table :estudantes do |t|
  t.string :nome
  t.string :dataNascimento
end