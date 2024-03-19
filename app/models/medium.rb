class Medium < ApplicationRecord
  has_many_attached :images
  validates :category, presence: true, inclusion: { in: ['Movie', 'TV Series'] }
  validates :rating, presence: true, inclusion: { in: %w[PG E 18+] }
end
