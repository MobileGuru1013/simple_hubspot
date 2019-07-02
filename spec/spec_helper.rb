ENV['RACK_ENV'] ||= 'test'

require File.expand_path 'lib/simple_hubspot'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f}

require 'webmock/rspec'
require 'helper'

RestClient.log = 'stdout' if ENV['HTTP_DEBUG']

RSpec.configure do |config|
  config.include Helper

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
