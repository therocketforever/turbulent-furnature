require 'rails_helper'
RSpec.describe BooksController, type: :controller do

  let :author { FactoryBot.create :author }
  let :format { Format.count == 0 ? FactoryBot.create( :format ) : Format.first }
  let :valid_attributes {{
    release: Time.now,
    title: Faker::RuPaul.quote,
    price: "10.00",
    authors: [ author ],
    format: format
   }}

  let :invalid_attributes { { } }

  describe "GET #index" do
    it "returns a success response" do
      book = Book.create! valid_attributes
      get :index
      expect( response ).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      book = Book.create! valid_attributes
      get :show, params: { id: book.to_param }
      expect( response ).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Book" do
        expect {
          post :create, params: { data: { attributes: valid_attributes } }
        }.to change( Book, :count ).by( 1 )
      end

      it "renders a JSON response with the new book" do

        post :create, params: { data: { attributes: valid_attributes } }
        expect( response ).to have_http_status( :created )
        expect( response.content_type ).to eq( 'application/json' )
        expect( response.location ).to eq( book_url( Book.last ) )
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new book" do

        post :create, params: { data: { attributes: invalid_attributes } }
        expect( response ).to have_http_status( :unprocessable_entity )
        expect( response.content_type ).to eq( 'application/json' )
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let :new_attributes  {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested book" do
        book = Book.create! valid_attributes
        put :update, params: { id: book.to_param, data: { attributes: new_attributes } }
        book.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the book" do
        book = Book.create! valid_attributes

        put :update, params: { id: book.to_param, data: { attributes: valid_attributes } }
        expect( response ).to have_http_status( :ok )
        expect( response.content_type ).to eq( 'application/json' )
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the book" do
        book = Book.create! valid_attributes

        put :update, params: { id: book.to_param, data: { attributes: invalid_attributes } }
        expect( response ).to have_http_status( :unprocessable_entity )
        expect( response.content_type ).to eq( 'application/json' )
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete :destroy, params: { id: book.to_param }
      }.to change( Book, :count ).by( -1 )
    end
  end

end
