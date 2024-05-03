class API::V1::MediaController < ApplicationController
  before_action :authenticate_user!

  def index
    media = Medium.all.ordered.map do |medium|
      medium_directory = format_directory_name(medium)
      regular_image_path = image_path(medium_directory, 'regular')
      trending_image_path = image_path(medium_directory, 'trending')

      thumbnails = { regular: base64_encode_image(regular_image_path) }

      thumbnails[:trending] = base64_encode_image(trending_image_path) if File.exist?(trending_image_path)

      medium.as_json(except: %i[created_at updated_at trending])
            .merge(isTrending: medium.trending?, isBookmarked: bookmark_exists?(medium), thumbnails:)
    end

    render json: media
  end

  private

  def format_directory_name(medium)
    medium.title.downcase.tr(' ', '-').delete("':")
  end

  def image_path(medium_directory, type)
    Rails.root.join('app', 'assets', 'thumbnails', medium_directory, type, 'large.jpg')
  end

  def base64_encode_image(image_path)
    image_data = File.open(image_path, 'rb').read
    "data:image/jpeg;base64,#{Base64.strict_encode64(image_data)}"
  end

  def bookmark_exists?(medium)
    medium.bookmarks.exists?(medium_id: medium.id)
  end
end
