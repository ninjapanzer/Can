require 'rspec'
require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.expect_with :stdlib
  config.filter_run_excluding skipped: true
end