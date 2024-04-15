require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3"
                                        :database => "Escola.sqlite3"
class Professor < ActiveRecord::Base;
  has_many :turmas, dependent: :destroy
end