class Agencia < ActiveRecord::Base
  belongs_to :banco
  validates_presence_of :banco_id, :codigo, :nome
end