require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do

  let :author { FactoryBot.create :author }
  let :library { Book.all }

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: library.to_param }
      expect(response).to be_success
    end
  end

end
