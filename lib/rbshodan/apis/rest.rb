require_relative 'utils.rb'

module Rbshodan
    module API

        class REST
            include Rbshodan::API::Utils

            attr_accessor :key

            URL = 'https://api.shodan.io'

