class PlanoDeContas < ActiveRecord::Base
  validates_presence_of :nome, :tipo, :banco_id, :grupo_de_despesa_id
end