require 'twitter'
class Twit

  @client

  def initialize(client)
    @client = client
  end

  # Gathers all valid tweets that can be sent
  def gather_tweets(trainLine, trainNumber)
    tweets = @client.user_timeline(trainLine, {count: 10})
    array_tweets = Array.new

    tweets.each do |tweet|
      if validate_tweet(tweet, trainNumber) && validate_time(tweet)
        array_tweets << tweet.text
      end

    end
    array_tweets
  end

  # Validates to make sure tweet has all matching criteria
  def validate_tweet(tweet, trainNumber)
    if tweet.text.include?('delay') || tweet.text.include?('late') || tweet.text.include?(trainNumber.nil? ? "" : trainNumber)
      true
    else
      false
    end
  end

  # Validates to make sure that the current tweet is no older than 5 minutes
  def validate_time(tweet)
    current = DateTime.now
    five_past = DateTime.new(current.year, current.month, current.day, current.hour, current.min-5, current.sec, "-05:00")
    tweet.created_at.to_time.to_i > five_past.to_time.to_i ? true : false
  end

end
