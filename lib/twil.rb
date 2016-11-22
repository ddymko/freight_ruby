require 'twilio-ruby'
require 'load_config'

class Twil

  @client

  def initialize(client)
    @client = client
  end

  def send_message(tweets, num)
    tweets.each do |tweet|
      begin
        message = @client.account.messages.create(
          from: ENV['twilio_num'],
          to: num,
          body: "Freight: #{tweet}"
          )
      rescue Twilio::REST::RequestError => e
        e.message
      end
      message.sid
    end
  end
end
