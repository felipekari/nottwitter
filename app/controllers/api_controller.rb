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

  def search
    fecha1 = params[:fecha1].to_date
    fecha2 = params[:fecha2].to_date + 1.day
    @tweets = Tweet.all.where(created_at: fecha1..fecha2)
    render json: @tweets
  end
end
