class LibrariesController < ApplicationController
  before_action :set_library, only: :show

  # GET /libraries/1
  def show
    render json: @library
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Book.all
    end

    # Only allow a trusted parameter "white list" through.
    def library_params
      params.fetch(:library, {})
    end
end
