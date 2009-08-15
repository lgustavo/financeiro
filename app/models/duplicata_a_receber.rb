class DuplicataAReceber < ActiveRecord::Base
  TIPOS_DE_COBRANCA = [ 'Banco', 'A Vista', 'Cheque', 'Carteira' ]

  validates_presence_of :cliente_id,
      :plano_de_contas_id,
      :tipo_de_cobranca,
      :data_de_vencimento,
      :data_de_emissao
  validates_inclusion_of :tipo_de_cobranca, :in => TIPOS_DE_COBRANCA
  validates_attribute_greater :data_de_vencimento, :than => :data_de_emissao

  belongs_to :plano_de_contas
  belongs_to :agencia
  belongs_to :cliente
  belongs_to :vendedor

end