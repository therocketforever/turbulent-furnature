require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  let(:valid_attributes) {
    { name: "William Gibsom" }
  }

  let(:invalid_attributes) {
    {}
  }

  describe "GET #index" do
    it "returns a success response" do
      author = Author.create! valid_attributes
      get :index
      expect( response ).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      author = Author.create! valid_attributes
      get :show, params: { id: author.to_param }
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Author" do
        expect {
          post :create, params: { data: { attributes: valid_attributes } }
        }.to change( Author, :count ).by( 1 )
      end

      it "renders a JSON response with the new author" do

        post :create, params: { data: { attributes: valid_attributes } }
        expect( response ).to have_http_status( :created )
        expect( response.content_type ).to eq( 'application/json' )
        expect( response.location ).to eq( author_url( Author.last ) )
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new author" do

        post :create, params: { data: { attributes: invalid_attributes } }
        expect( response ).to have_http_status( :unprocessable_entity )
        expect( response.content_type ).to eq( 'application/json' )
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let( :new_attributes ) {
        { name: "Bruce Sterling" }
      }

      it "updates the requested author" do
        author = Author.create! valid_attributes
        put :update, params: { id: author.to_param, data: { attributes: new_attributes } }
        author.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the author" do
        author = Author.create! valid_attributes

        put :update, params: { id: author.to_param, data: { attributes: valid_attributes } }
        expect( response ).to have_http_status( :ok )
        expect( response.content_type ).to eq( 'application/json' )
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the author" do
        author = Author.create! valid_attributes

        put :update, params: { id: author.to_param, data: { attributes: invalid_attributes } }
        expect( response ).to have_http_status( :unprocessable_entity )
        expect( response.content_type ).to eq( 'application/json' )
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested author" do
      author = Author.create! valid_attributes
      expect {
        delete :destroy, params: { id: author.to_param }
      }.to change( Author, :count ).by( -1 )
    end
  end

end
