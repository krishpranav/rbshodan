require_relative 'utils.rb'

module Shodanz
  module API
    class REST
      include Shodanz::API::Utils

      attr_accessor :key

      URL = 'https://api.shodan.io/'

      def initialize(key: ENV['SHODAN_API_KEY'])
        @url      = URL
        @client   = Async::HTTP::Client.new(Async::HTTP::Endpoint.parse(@url))
        self.key  = key

        warn 'No key has been found or provided!' unless key?
      end

      def key?
        return true if @key

        false
      end

      def host(ip, **params)
        get("shodan/host/#{ip}", **params)
      end

      def host_count(query = '', facets: {}, **params)
        params[:query] = query
        params = turn_into_query(**params)
        facets = turn_into_facets(**facets)
        get('shodan/host/count', **params.merge(**facets))
      end

      def host_search(query = '', facets: {}, page: 1, minify: true, **params)
        params[:query] = query
        params = turn_into_query(**params)
        facets = turn_into_facets(**facets)
        params[:page] = page
        params[:minify] = minify
        get('shodan/host/search', **params.merge(**facets))
      end

      def host_search_tokens(query = '', **params)
        params[:query] = query
        params = turn_into_query(**params)
        get('shodan/host/search/tokens', **params)
      end

      def ports
        get('shodan/ports')
      end

      def protocols
        get('shodan/protocols')
      end

      def scan(*ips)
        post('shodan/scan', ips: ips.join(','))
      end

      def crawl_for(**params)
        params[:query] = ''
        params = turn_into_query(**params)
        post('shodan/scan/internet', **params)
      end

      def scan_status(id)
        get("shodan/scan/#{id}")
      end

      def community_queries(**params)
        get('shodan/query', **params)
      end

      def search_for_community_query(query, **params)
        params[:query] = query
        params = turn_into_query(**params)
        get('shodan/query/search', **params)
      end

      def popular_query_tags(size = 10)
        params = {}
        params[:size] = size
        get('shodan/query/tags', **params)
      end

      def profile
        get('account/profile')
      end

      def resolve(*hostnames)
        get('dns/resolve', hostnames: hostnames.join(','))
      end

      def reverse_lookup(*ips)
        get('dns/reverse', ips: ips.join(','))
      end

      def http_headers
        get('tools/httpheaders')
      end

      def my_ip
        get('tools/myip')
      end

      def honeypot_score(ip)
        get("labs/honeyscore/#{ip}")
      end

      def info
        get('api-info')
      end
    end
  end
end
