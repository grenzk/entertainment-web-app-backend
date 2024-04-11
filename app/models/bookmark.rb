class Bookmark < ApplicationRecord
  belongs_to :medium

  validates :medium, presence: true
end
