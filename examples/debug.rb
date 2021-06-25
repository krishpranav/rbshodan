$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rbshodan'
require 'pry'

client = Rbshodan.client.new
binding.pry