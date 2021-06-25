require "spec_helper"

RSpec.describe Rbshodan::API::REST do
    before do
        @client = Rbshodan.api.rest.new
    end
    