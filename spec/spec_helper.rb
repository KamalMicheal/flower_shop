require 'simplecov'

SimpleCov.start do
  add_filter 'config'
  add_filter 'spec'
  minimum_coverage 100
end

require 'boot'

require 'rubygems'
require 'bundler'
Bundler.require(:default)

RSpec.configure do |config|
  config.order = :random
end
