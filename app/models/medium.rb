class Medium < ApplicationRecord
  has_many_attached :images

  validates :title, presence: true, length: { maximum: 30 }
  validates :year, presence: true
  validates :category, presence: true, inclusion: { in: ['Movie', 'TV Series'] }
  validates :rating, presence: true, inclusion: { in: %w[PG E 18+] }
  validates :is_trending, presence: true
  validates :images, attached: true, content_type: %w[image/png image/jpeg],
                     size: { less_than: 5.megabytes }
end
