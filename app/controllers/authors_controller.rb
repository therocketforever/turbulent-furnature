class AuthorsController < ApplicationController
  before_action :set_author, only: [ :index, :show, :update, :destroy ]

  def index
    @authors ||= Author.all
    render json: serialize_authors { @authors }
  end

  def show
    render json: serialize_author { @author }
  end

  def create
    @author ||= Author.new(author_params)

    if @author.save
      render json: serialize_author { @author }, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      render json: serialize_author { @author }
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy
  end

  private
    def set_author
      @author ||= !!params[:id] ? Author.find(params[:id]) : Author.all
    end

    def author_params
      params.fetch( :data ).fetch( :attributes ).permit( :name )
    end

    def serialize_authors
      JSONAPI::Serializer.serialize yield, is_collection: true
    end

    def serialize_author
      JSONAPI::Serializer.serialize yield
    end
end
