class DuplicataAReceber < ActiveRecord::Base
  TIPOS_DE_COBRANCA = [ 'Banco', 'A Vista', 'Cheque', 'Carteira' ]

  validate :validar_data_de_vencimento_maior_que_emissao

  validates_presence_of :cliente_id,
      :plano_de_contas_id,
      :tipo_de_cobranca,
      :data_de_vencimento,
      :data_de_emissao
  validates_inclusion_of :tipo_de_cobranca, :in => TIPOS_DE_COBRANCA

  belongs_to :plano_de_contas
  belongs_to :agencia
  belongs_to :cliente
  belongs_to :vendedor

  private

  def validar_data_de_vencimento_maior_que_emissao
    if ( !self.data_de_vencimento.blank? &&
      !self.data_de_emissao.blank? &&
      ( self.data_de_vencimento < self.data_de_emissao ) )
      self.errors.add( :data_de_vencimento, "deve ser maior que data de emissâo" )
    end
    self.errors.blank?
  end

end