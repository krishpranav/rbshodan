$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "rbshodan"
require "chart_js"

module Top10
  @rest_api = Shodanz.api.rest.new
  def self.check(product)
    begin
      @rest_api.host_count(product: product, facets: { country: 10 })["facets"]["country"].collect { |x| x.values }.to_h.invert
    rescue
      puts "Unable to succesffully check the Shodan API."
      exit 1
    end
  end
end

result = Top10.check("apache")