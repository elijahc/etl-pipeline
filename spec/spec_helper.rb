require 'coveralls'
Coveralls.wear!

require 'pry'
require 'etl-pipeline'
include Pipeline::Parser

RSpec.configure do |config|
  config.expect_with :rspec
end
