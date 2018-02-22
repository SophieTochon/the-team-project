Dotenv.load

class TwitterBot
  attr_accessor :tab

  def initialize()
    @tab_id = []
  	
  end

  def perform
  	log_in_to_twitter
    search_tweet("#Fifa18 -rt")
    search_tweet("#FUT -rt")
    @tab_id

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
    @client.search(string, lang: "fr").take(3).each do |tweet|
      if tweet.is_a? Twitter::Tweet
        puts "#{tweet.text}"
        @tab_id << tweet.id
        @client.fav tweet
      end
    end
  end


  def send_tweet
  	@client.update("#{self.tweet}")
  end


end
