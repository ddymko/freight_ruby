lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'configs/twit_config'
require 'configs/db_config'
require 'configs/twilio_config'
require 'twit'
require 'twil'
require 'db_data'

db = DBData.new(DBConfig.con)
train_line, train_number = db.user_configs(ARGV[1])
number = db.user_number(ARGV[0])
tweets = Twit.new(TwitConfig.client)
tweet_text = tweets.gather_tweets(train_line, train_number)


twilio = Twil.new(TwilioConfig.client)

puts tweet_text
if  !tweet_text.empty?
  twilio.send_message(tweet_text, number)
end
