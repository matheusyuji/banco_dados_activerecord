require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Escola.sqlite3"

ActiveRecord::Base.connection.create_table :carteirinhas do |t|
  t.string :numero
  t.belongs_to :estudante, foreign_key:true
end                                   