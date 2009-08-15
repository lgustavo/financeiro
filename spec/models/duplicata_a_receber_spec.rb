require File.dirname(__FILE__) + "/../spec_helper"

describe DuplicataAReceber do

  describe 'em validaçôes' do

    [ :cliente_id,
      :plano_de_contas_id,
      :tipo_de_cobranca,
      :data_de_vencimento,
      :data_de_emissao ].each do |campo|
      it { should validate_presence_of(campo) }
    end

   [ 'Banco', 'A Vista', 'Cheque', 'Carteira' ].each do |valor|
     it { should allow_value(valor).for(:tipo_de_cobranca) }
   end

   %w{algum outro valor}.each do |valor|
     it { should_not allow_value(valor).for( :tipo_de_cobranca ) }
   end

    describe 'validações nas datas' do

      before do
        @duplicata = DuplicataAReceber.new
      end

      it ' nâo deve aceitar data de vencimento anterior a data de emissao' do
        @duplicata.data_de_emissao = 1.day.ago.to_date
        @duplicata.data_de_vencimento = 2.days.ago.to_date
        @duplicata.should have(1).error_on( :data_de_vencimento )
      end

    end

  end

  describe 'em associaçôes' do

    [ :cliente, :plano_de_contas, :vendedor, :agencia ].each do |campo|
      it do
        should belong_to(campo)
      end
    end

  end

end