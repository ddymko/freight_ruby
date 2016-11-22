require 'twilio-ruby'
require 'load_config'

module TwilioConfig

  def TwilioConfig.client
    Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_token']
  end

end
