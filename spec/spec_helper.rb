require 'simplecov'

SimpleCov.start

require_relative 'test_helper'

Dir[File.expand_path('../../lib/*.rb', __FILE__)].each { |f| require f }
