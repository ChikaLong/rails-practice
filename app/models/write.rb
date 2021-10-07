class Write < ApplicationRecord
  belongs_to :user
  has_many :write_comments, dependent: :destroy
  attachment :image

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
