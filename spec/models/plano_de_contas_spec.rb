require File.dirname(__FILE__) + "/../spec_helper"

describe PlanoDeContas do

  describe 'em validações' do

    [ :nome, :tipo, :banco_id, :grupo_de_despesa_id ].each do |campo|
      it { should validate_presence_of(campo) }
    end

    

  end

end