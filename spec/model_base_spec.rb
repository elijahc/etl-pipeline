require 'spec_helper'
class TestModel < Pipeline::Model::Base
  attr_accessor :var

  def format_var(var)
    case var
    when 'A'
      return 'B'
    when 'Y'
      return 'Z'
    end
  end
end

describe Pipeline::Model::Base do
  before :each do
    @test_model = TestModel.new
  end

  describe '#attributes' do
    it 'returns a hash version of the model' do
      expect(@test_model.attributes).to be_instance_of Hash
    end
  end

  describe '#formatted_attributes' do
    before :each do
      @test_model.var = 'A'
    end

    it 'iterates over its own attributes and returns a formatted attributes hash' do
      expect(@test_model.formatted_attributes).to be_instance_of Hash
      expect(@test_model.var).to eq('A')
      expect(@test_model.formatted_attributes[:var]).to eq('B')
    end
  end
end
