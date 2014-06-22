require 'rspec'
require 'pry'
require 'mocha'

RSpec.configure do |config|
  config.mock_framework = :mocha
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.expect_with :stdlib
  config.filter_run_excluding skipped: true
end