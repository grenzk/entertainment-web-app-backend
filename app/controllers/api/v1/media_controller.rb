class API::V1::MediaController < ApplicationController
  def index
    @media = Medium.all

    response = @media.map do |medium|
      thumbnails = { regular: url_for(medium.images[0]) }
      thumbnails[:trending] = url_for(medium.images[1]) if medium.images[1].present?

      medium.as_json(except: %i[created_at updated_at]).merge(thumbnails:)
    end

    render json: { data: response }
  end
end
