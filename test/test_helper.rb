require 'bundler/setup'
Bundler.require

require "minitest/autorun"

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

Dir[File.expand_path('../fixtures/*.rb', __FILE__)].each { |f| require f }