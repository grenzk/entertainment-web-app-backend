class API::V1::BookmarksController < ApplicationController
  before_action :set_medium, only: %i[destroy]

  def index
    render json: Bookmark.includes(:medium).all, except: %i[id created_at updated_at]
  end

  def create
    bookmark = Bookmark.new(bookmark_params)

    if bookmark.save
      render json: bookmark, status: :created
    else
      render json: bookmark.errors, status: :unprocessable_entity
    end
  end

  def destroy
    bookmark = @medium.bookmarks.find_by(medium_id: params[:id])

    bookmark.destroy
    head :no_content
  end

  private

  def set_medium
    @medium = Medium.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:medium_id)
  end
end
