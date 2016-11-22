require 'yaml'
require 'dotenv'
module LoadConfig
      Dotenv.load(File.expand_path("../../.#{ENV['FREIGHT_ENV']}.env", __FILE__))
end
