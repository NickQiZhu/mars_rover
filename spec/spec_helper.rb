require 'simplecov'

SimpleCov.start

Dir[File.expand_path('../../lib/*.rb', __FILE__)].each { |f| require f }
