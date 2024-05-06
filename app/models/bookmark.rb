class Bookmark < ApplicationRecord
  belongs_to :medium
  belongs_to :user

  validates :medium, presence: true
  validates :user, presence: true
end
