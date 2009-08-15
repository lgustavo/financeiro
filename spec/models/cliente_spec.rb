require File.dirname(__FILE__) + "/../spec_helper"

describe Cliente do

  describe 'em validações' do
    it { should validate_presence_of(:nome) }
  end

end