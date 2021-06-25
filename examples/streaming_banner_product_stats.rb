$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rbshodan'

trap "SIGINT" do
    exit 0
end

