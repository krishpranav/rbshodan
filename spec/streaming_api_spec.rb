require "spec_helper"

RSpec.describe Rbshodan::API::Streaming do
    before do
        @client = Rbshodan.api.Streaming.new
    end

    before(:each) do
        sleep 3
    end

    