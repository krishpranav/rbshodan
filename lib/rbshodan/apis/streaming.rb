require_relative 'utils.rb'

module Rbshodan
    module API

        class Streaming
            include Rbshodan::API::Utils

            attr_accessor :key

            URL = 'https://stream.shodan.io'

            def initialize(key: ENV['SHODAN_API_KEY'])
                @url           =   URL
                @client        =   Async::HTTP::Client.new(Async::HTTP::Endpoint.parse(@url))
                self.key       = key

                warn 'No key has been found or provided!!!' unless key?
            end
            
