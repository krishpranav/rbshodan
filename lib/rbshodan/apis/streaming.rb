require_relative 'utils.rb'


module Shodanz
  module API

    class Streaming
      include Shodanz::API::Utils

      attr_accessor :key

      URL = 'https://stream.shodan.io/'

      def initialize(key: ENV['SHODAN_API_KEY'])
        @url      = URL
        @client   = Async::HTTP::Client.new(Async::HTTP::Endpoint.parse(@url))
        self.key  = key

        warn 'No key has been found or provided!' unless key?
      end

      def key?
        return true if @key; false

      end

      def banners(**params)
        slurp_stream('shodan/banners', **params) do |data|
          yield data
        end
      end


      def banners_within_asns(*asns, **params)
        slurp_stream("shodan/asn/#{asns.join(',')}", **params) do |data|
          yield data
        end
      end

      def banners_within_asn(param)
        banners_within_asns(param) do |data|
          yield data
        end
      end

      def banners_within_countries(*params)
        slurp_stream("shodan/countries/#{params.join(',')}") do |data|
          yield data
        end
      end

      def banners_on_ports(*params)
        slurp_stream("shodan/ports/#{params.join(',')}") do |data|
          yield data
        end
      end

    
      def banners_on_port(param)
        banners_on_ports(param) do |data|
          yield data
        end
      end

      def alerts
        slurp_stream('alert') do |data|
          yield data
        end
      end

      def alert(id)
        slurp_stream("alert/#{id}") do |data|
          yield data
        end
      end
    end
  end
end
