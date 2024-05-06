class API::V1::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.bookmarks.includes(:medium), except: %i[id created_at updated_at user_id]
  end

  def create
    bookmark = current_user.bookmarks.build(bookmark_params)

    if bookmark.save
      render json: bookmark, status: :created
    else
      render json: bookmark.errors, status: :unprocessable_entity
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(medium_id: params[:id])

    bookmark.destroy
    head :no_content
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:medium_id)
  end
end
