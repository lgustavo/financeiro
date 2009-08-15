require File.dirname(__FILE__) + "/../spec_helper"

describe GrupoDeDespesas do

  describe 'on validações' do

    it { should validate_presence_of(:nome) }

  end

end