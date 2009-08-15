require File.dirname(__FILE__) + "/../spec_helper"

describe Banco do

  describe 'em validações' do
    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:codigo) }
  end

  describe 'em associaçôes' do
    it { should have_many(:agencias) }
  end

end