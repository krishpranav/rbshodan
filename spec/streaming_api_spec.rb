require "spec_helper"

RSpec.describe Rbshodan::API::Streaming do
    before do
        @client = Rbshodan.api.Streaming.new
    end

    before(:each) do
        sleep 3
    end

    describe '#banners' do
        def check
            @client.banners(limit:  1) do |banner|
                expect(banner).to be_a(Hash)
            end
        end
        