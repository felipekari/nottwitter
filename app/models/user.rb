class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :followers, dependent: :destroy



  def user_following_count
    Follower.where(follower_id: self.id).count
  end

  def user_tweets_count
    Tweet.where(user_id: self.id, rt_tweet_id: nil).count
  end

  def user_rtweets_count
    Tweet.where(user_id: self.id).where.not(rt_tweet_id:nil).count
  end

  def user_likes_count
    Like.where(user_id: self.id).count
  end

 end
