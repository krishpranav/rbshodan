$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "rbshodan"
require "chart_js"

module Top10
    @rest_api = Rbshodan.api.rest.new
    