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

  scope :tweets_for_me, lambda { |user| joins(:user, user: [:followers]).where("followers.follower_id = ?", user.id) }


  # scope :tweets_for_me, lambda { where(:attibute => value)}

  def hcontent
    tcont = self.content.split
    tcont.map! do |tc|
      if tc.include? "#"
        tc[0] = ''
        # tc = "<%= link_to '#{tc}'', tweets_path( q: {content_cont: '#{tc}'}) %>"
        tc = "<a href='/tweets?q%5Bcontent_cont%5D=#{tc}'>##{tc}</a>"
      else
        tc
      end
    end
    tcont = tcont.join(' ')
  end
end
