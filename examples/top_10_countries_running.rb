$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "rbshodan"
require "chart_js"

module Top10
    @rest_api = Rbshodan.api.rest.new
    
    def self.check(product)
        begin
            @rest_api.host_count(product: product, facets: { country: 10 })["facets"]["country"].collect { |x| x.values }.to_h.invert
        rescue
            puts "Unable to succesfully check the shodan API."
            exit 1
        end
    end
end
