class User < ApplicationRecord
  has_many :bookmarks

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
