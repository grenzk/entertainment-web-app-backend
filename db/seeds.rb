# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "\n== Seeding the database with fixtures =="
system('bin/rails db:fixtures:load')

shows = Medium.all

shows.each do |show|
  show_directory = show.title.downcase.tr(' ', '-').delete("':")
  regular_image_path = Rails.root.join('app', 'assets', 'thumbnails', show_directory, 'regular', 'large.jpg')

  images = [] << { io: File.open(regular_image_path), filename: 'large.jpg' }

  if show.trending
    trending_image_path = Rails.root.join('app', 'assets', 'thumbnails', show_directory, 'trending',
                                          'large.jpg')
    images << { io: File.open(trending_image_path), filename: 'large.jpg' }
  end

  show.images.attach(images)
end
