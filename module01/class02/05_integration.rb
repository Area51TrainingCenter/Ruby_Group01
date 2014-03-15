# gem install instagram

CLIENT_ID = "4f4063bc66cf4c0cb6754b11d44014b6"

require "instagram"
require 'pp'

Instagram.configure do |config|
  config.client_id = CLIENT_ID
end

results = Instagram.media_popular
pp results.first["images"]["standard_resolution"]["url"]
url = results.first["images"]["standard_resolution"]["url"]

require 'asciiart'
art = AsciiArt.new(url)
puts art.to_ascii_art(width: 50)