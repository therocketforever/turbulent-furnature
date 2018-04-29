require "rails_helper"

RSpec.describe LibrariesController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect( get: "/library" ).to route_to( "libraries#show" )
    end

  end
end
