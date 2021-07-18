class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  validates :content, presence: true, length: { maximum: 280,
                                                too_long: '280 characters in post is the maximum allowed.' }
end
