class ApiController < ActionController::API
  def news
    @tweets = Tweet.all.order(created_at: :desc).limit(50)
    tarray = []
    @tweets.each do |tweet|
      thash = {
        id: tweet.id,
        content: tweet.content,
        user_id: tweet.user.id,
        like_count: tweet.likes.count,
        retweets_count: tweet.rtcount,
        retweeted_from: tweet.otweet.nil? ? 'Tweet original' : tweet.otweet.id
      }
      tarray.push thash
    end
    render json: tarray
  end
end
