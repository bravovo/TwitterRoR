class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :twits

  has_one_attached :profile_pic

  has_many :follower_relationships, class_name: "Follow", foreign_key: "followed_id"
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followed_relationships, class_name: "Follow", foreign_key: "follower_id"
  has_many :followings, through: :followed_relationships, source: :followed

  def follow(user)
    followings << user
  end

  def unfollow(user)
    followings.delete(user)
  end
end
