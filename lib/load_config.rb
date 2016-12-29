require 'yaml'
require 'dotenv'
module LoadConfig
      Dotenv.load(File.expand_path("../../.env", __FILE__))
end
