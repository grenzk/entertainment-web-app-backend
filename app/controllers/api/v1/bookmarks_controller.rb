class API::V1::BookmarksController < ApplicationController
  def index
    render json: Bookmark.includes(:medium).all, except: %i[id created_at updated_at]
  end
end
