$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rbshodan'
require 'command_lion'
require 'yaml'
require 'pry'


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


CommandLion::App.run do
    name "Top 10 Countires Running a Product Using Shodan"
  
    command :product do
      description "Search for this given product."
      type :string
      flag "--product"
