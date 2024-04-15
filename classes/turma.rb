require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3"
                                        :database => "Escola.sqlite3"
class Turma < ActiveRecord::Base;
  has_and_belongs_to_many :estudantes, -> { distinct }, dependent: :destroy
  belongs_to :professor
end