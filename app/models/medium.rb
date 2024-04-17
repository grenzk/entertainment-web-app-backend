class Medium < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, length: { maximum: 30 }
  validates :year, presence: true
  validates :category, presence: true, inclusion: { in: ['Movie', 'TV Series'] }
  validates :rating, presence: true, inclusion: { in: %w[PG E 18+] }
  validates :trending, presence: true

  scope :ordered, -> { order(id: :asc) }
end
