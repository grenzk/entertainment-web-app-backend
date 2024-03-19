class Medium < ApplicationRecord
  validates :category, inclusion: { in: ['Movie', 'TV Series'] }
  validates :rating, inclusion: { in: %w[PG E 18+] }
end
