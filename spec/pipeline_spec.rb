require 'spec_helper'
class TestPipeline < Pipeline::Base
end

describe Pipeline do
  it 'has a version number' do
    expect(Pipeline::VERSION).not_to be_nil
    expect(Pipeline::VERSION).to be_instance_of String
  end
  describe '#new' do
    it 'returns a new instance of Pipeline' do
      expect(TestPipeline.new).to be_instance_of TestPipeline
    end
  end


end

describe Pipeline::Base do

end

