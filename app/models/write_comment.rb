class WriteComment < ApplicationRecord
  belongs_to :user
  belongs_to :write

  validates :comment, presence: true
end
