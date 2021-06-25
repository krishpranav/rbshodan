$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pty'
require 'async'
require 'rbshodan'


client = Rbshodan.client.new

stats = Hash.new(0)

ports    = [21, 22, 80, 443]
services = ['ftp', 'ssh', 'http', 'https']

ports_with_service_names = ports.zip(services)

Async do
    ports_with_service_names.each do |port, service|
        client.streaming_api.banners_on_port(port) do |banner|
            if ip = banner['ip_str']
                Async do
                    resp = client.rest_api.honeypot_score(ip).wait
                    binding.pry if resp.nil?
                    puts "#{ip} has a #{resp *100}% chance of being a hoenypot "
                rescue Rbshodan::Errors::RateLimited
                    sleep 1
                rescue => error
                    binding.pry
                end
            end
        end
    end
end
