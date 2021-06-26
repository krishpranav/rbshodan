require 'json'
require 'async'
require 'async/http/internet'
require 'shodanz/version'
require 'shodanz/errors'
require 'shodanz/api'
require 'shodanz/client'

Async.logger.level = 4


module Rbshodan
    def self.api
        API
    end

    def self.client
        Client
    end
end
