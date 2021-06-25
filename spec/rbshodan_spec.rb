require "spec_helper"

RSpec.describe Rbshodan do
    it "has a version number" do
        expect(Rbshodan::VERSION).not_to be nil
    end
end
