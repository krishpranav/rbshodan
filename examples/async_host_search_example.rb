$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'async'
require 'rbshodan'

client = Rbshodan.client.new

webservers = ['apache', 'nginx', 'caddy', 'lighttpd', 'cherokee']

started = Time.now.sec
webservers.each do |webserver|
    client.rest_api.host_search(webserver)
    puts webserver
end

puts "Sequential took #{Time.now.sec - started} seconds"

