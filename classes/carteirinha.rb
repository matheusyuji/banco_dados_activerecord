require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3"
                                        :database => "Escola.sqlite3"
class Carteirinha < ActiveRecord::Base;
  belongs_to :paciente
end