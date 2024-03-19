class Medium < ApplicationRecord
  validates :category, presence: true, inclusion: { in: ['Movie', 'TV Series'] }
  validates :rating, presence: true, inclusion: { in: %w[PG E 18+] }
end
