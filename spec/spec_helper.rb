require 'simplecov'

SimpleCov.start

require_relative 'image_helper'

Dir[File.expand_path('../../lib/*.rb', __FILE__)].each { |f| require f }
