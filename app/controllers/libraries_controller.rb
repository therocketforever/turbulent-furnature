class LibrariesController < ApplicationController
  before_action :set_library, only: :show

  def show
    render json: serialize_library { @library }
  end

  private
    def set_library
      @library ||= Book.all
    end

    def serialize_library
      JSONAPI::Serializer.serialize yield, include: ['authors'], is_collection: true
    end
end
