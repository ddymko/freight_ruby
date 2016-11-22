require 'twilio-ruby'
require 'load_config'

class Twil

  @client

  def initialize(client)
    @client = client
  end

  def send_message(tweets, num)
    tweets.each do |tweet|

      @client.account.messages.create(
        from: ENV['twilio_num'],
        to: num,
        body: tweet
      )
    end
  end
end