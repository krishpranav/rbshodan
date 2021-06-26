module Rbshodan
    class Client

        attr_reader :rest_api
        attr_reader :streaming_api
        attr_reader :exploits_api

        def initialize(key: ENV['SHODAN_API_KEY'])
            raise Rbshodan::Errors::NoAPI if key.nil?

            @rest_api       = Rbshodan.api.rest.new(key: key)
            @streaming_api  = Rbshodan.api.streaming.new(key: key)
            @exploits_api   = Rbshodan.api.exploits.new(key: key)
        end
        