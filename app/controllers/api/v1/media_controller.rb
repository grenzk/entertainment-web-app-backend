class API::V1::MediaController < ApplicationController
  def index
    response = Medium.all.map do |medium|
      medium_directory = format_directory_name(medium)
      regular_image_path = "#{Rails.root}/app/assets/thumbnails/#{medium_directory}/regular/large.jpg"
      trending_image_path = "#{Rails.root}/app/assets/thumbnails/#{medium_directory}/trending/large.jpg"

      thumbnails = { regular: base64_encode_image(regular_image_path) }
      thumbnails[:trending] = base64_encode_image(trending_image_path) if File.exist?(trending_image_path)

      medium.as_json(except: %i[created_at updated_at trending])
            .merge(isTrending: medium.trending?,
                   isBookmarked: medium.bookmarks.exists?(medium_id: medium.id),
                   thumbnails:)
    end

    render json: response
  end

  private

  def format_directory_name(medium)
    medium.title.downcase.tr(' ', '-').delete("':")
  end

  def base64_encode_image(image_path)
    image_data = File.open(image_path, 'rb').read
    "data:image/jpeg;base64,#{Base64.strict_encode64(image_data)}"
  end
end
