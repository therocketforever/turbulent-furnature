require 'rails_helper'

RSpec.describe "Library", type: :request do
  describe "GET /library" do
    it "works! (now write some real specs)" do
      get library_path
      expect(response).to have_http_status(200)
    end
  end
end
