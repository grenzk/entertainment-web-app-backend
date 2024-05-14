class User < ApplicationRecord
  has_many :bookmarks

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  def as_json(options = {})
    super(options.merge(except: %i[updated_at created_at]))
  end
end
