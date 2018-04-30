class BooksController < ApplicationController
  before_action :set_book, only: [ :index, :show, :update, :destroy ]
  def index
    @books ||= Book.all
    render json: serialize_books { @books }
  end

  def show
    render json: serialize_book { @book }
  end

  def create
    @book ||= Book.new(book_params)

    if @book.save
      render json: serialize_book { @book }, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: serialize_book { @book }
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
  end

  private
    def set_book
      @book ||= !!params[:id] ? Book.find(params[:id]) : Book.all
    end

    def book_params
      book ||= params.fetch( :data ).fetch( :attributes ).permit( :title, :release, :price, :authors, :format )
      authors ||= Author.where id: book[:authors].split(",")
      format = case book[:format].to_sym
        when :softcover
          Format.find Format::Softcover
        when :digital
          Format.find Format::Digital
      else
        Format.find Format::Hardcover
      end

      { title: book[:title], release: Time.new( book[:release] ), price: book[:price].to_f, authors: authors, format: format }
    end

    def serialize_books
      JSONAPI::Serializer.serialize yield, is_collection: true
    end

    def serialize_book
      JSONAPI::Serializer.serialize yield
    end
end
