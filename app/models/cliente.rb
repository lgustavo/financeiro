class Cliente < ActiveRecord::Base
  validates_presence_of :nome
  has_many :duplicatas_a_receber
end

