class Banco < ActiveRecord::Base
  has_many :agencias
  validates_presence_of :nome, :codigo
end