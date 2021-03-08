class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, optional: true
  has_many :likes, dependent: :destroy

  validates_presence_of :content, :unless => :rt_tweet_id?

  def rtcount
    if @rt_tweet_id =! nil
      Tweet.where(rt_tweet_id: self.id).count
    end
  end

  def otweet
    Tweet.find_by(id: self.rt_tweet_id)
  end

  # scope :tweets_for_me, -> { joins(:user, user: [:followers]).where(followers: { follower_id: current_user.id}) }

end
