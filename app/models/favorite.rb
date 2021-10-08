class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :write

  validates_uniqueness_of :write_id, scope: :user_id
end
