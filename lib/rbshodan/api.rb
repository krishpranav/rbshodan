require_relative 'apis/rest.rb'
require_relative 'apis/streaming.rb'
require_relative 'apis/exploits.rb'


module Rbshodan
    
    module API

        def self.rest
            REST
        end


        def self.streaming
            Streaming
        end

        def self.exploits
            Exploits
        end
    end
end
