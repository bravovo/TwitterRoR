class Twit < ApplicationRecord
  belongs_to :user

  has_one_attached :images
  has_many :likes
  has_many :likers, through: :likes, source: :user
end
