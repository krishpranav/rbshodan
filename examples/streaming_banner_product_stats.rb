$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rbshodan'

trap "SIGINT" do
    exit 0
end

streaming_api = Rbshodan.api.streaming.new

stats = Hash.new(0)

streaming_api.banners do |banner|
    product = banner['product']

    next if product.nil?

    puts "#{stats[product] += 1} #{product}"
end
