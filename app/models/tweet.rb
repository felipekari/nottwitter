class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, optional: true
  has_many :likes, dependent: :destroy

  validates_presence_of :content

  def rtcount
    if @rt_tweet_id =! nil
      Tweet.where(rt_tweet_id: self.id).count
    end
  end
end
