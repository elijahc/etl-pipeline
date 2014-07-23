require 'spec_helper'
class TestPipeline < Pipeline::Base
end

describe Pipeline do
  it 'has a version number' do
    expect(Pipeline::VERSION).not_to be_nil
    expect(Pipeline::VERSION).to be_instance_of String
  end


end

describe Pipeline::Base do

end

