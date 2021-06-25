$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rbshodan'

trap "SIGINT" do
    exit 0
end

streaming_api = Rbshodan.api.streaming.new

stats = Hash.new(0)

