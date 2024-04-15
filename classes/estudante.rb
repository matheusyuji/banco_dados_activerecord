require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Escola.sqlite3"
class Estudante < ActiveRecord::Base;
  has_and_belongs_to_many :disciplinas, -> { distinct }, dependent: :destroy
  has_one :carteirinha, dependent: :destroy
end