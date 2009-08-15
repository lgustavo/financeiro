require File.dirname(__FILE__) + "/../spec_helper"

describe Agencia do

  describe 'em validações' do
    [ :banco_id, :codigo, :nome ].each do |campo|
      it {should validate_presence_of( campo )}
    end
  end

  describe 'em associações' do
    it { should belong_to(:banco) }
  end

end