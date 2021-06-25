$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'async'
require 'rbshodan'

client = Rbshodan.client.new
