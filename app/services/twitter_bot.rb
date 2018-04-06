Dotenv.load

class TwitterBot
  attr_accessor :tab

  def initialize()
    @tab_tweet = []	
  end

  def perform
  	log_in_to_twitter
    search_tweet("#eSports -rt")
    search_tweet("#FUT18 -rt")
    #fav_tweet
    #@tab_tweet
    send_tweet
  end

  def log_in_to_twitter
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET']
      config.access_token        = ENV['TWITTER_TOKEN']
      config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
    end
  end

  def search_tweet(string)
    @client.search(string, lang: "fr").take(100).each do |tweet|
      if tweet.is_a? Twitter::Tweet
        puts "#{tweet.text}"
        @tab_tweet << tweet
      end
    end
  end

  def fav_tweet
    @tab_tweet.each do |tweet|
      @client.fav tweet
    end
  end

  def send_tweet
  	@tab_tweet.each do |tweet|
      @client.update("@#{tweet.user.screen_name} Une app pour tracker tes résultats sportifs et te comparer à tes potes, ça t'intéresse ? :)")
      sleep(2)
    end
  end


end
