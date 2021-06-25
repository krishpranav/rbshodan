$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'async'
require 'rbshodan'

client = Rbshodan.client.new


client.streaming_api.banners do |banner|
    if ip = banner['ip_str']
        Async do
            score = client.rest_api.honeypot_score(ip).wait
            puts "#{ip} has a #{score * 100}% chance of being a honeypot"
        rescue Rbshodan::Errors::RateLimited
            sleep rand
            retry
        rescue StandartError
            next
        end
    end
end

