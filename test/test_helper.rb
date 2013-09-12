require 'bundler/setup'
Bundler.require

require 'coveralls'
Coveralls.wear!

require "minitest/autorun"

Dir[File.expand_path('../fixtures/*.rb', __FILE__)].each { |f| require f }