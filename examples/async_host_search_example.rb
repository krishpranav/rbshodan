$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'async'
require 'rbshodan'

client = Rbshodan.client.new

webservers = ['apache', 'nginx', 'caddy', 'lighttpd', 'cherokee']

started = Time.now.sec