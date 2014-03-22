require 'asciiart'
require "instagram"
require 'flickraw'
require 'pp'

CLIENT_ID = "4f4063bc66cf4c0cb6754b11d44014b6"
FLICKR_API_KEY = "b872f152d394d2062eae38a04664434f"
FLICKR_SHARED_SECRET = "a368e75758015a8e"

Instagram.configure do |config|
  config.client_id = CLIENT_ID
end

class InstagramImage
  def initialize(index = 0)
    @media = Instagram.media_popular[index]
  end

  def image
    @media['images']['standard_resolution']['url']
  end
end

class FlickrImage
  # gem install flickraw
  def initialize(index = 0)
    FlickRaw.api_key = FLICKR_API_KEY
    FlickRaw.shared_secret = FLICKR_SHARED_SECRET

    flickr = FlickRaw::Flickr.new
    @media = flickr.photos.getRecent[index]
  end

  def image
    FlickRaw.url_b(@media)
  end
end

class AsciiImage
  def initialize(image)
    if image.respond_to?(:image)
      @image = image
    end
  end

  def to_ascii
    @ascii ||= AsciiArt.new(@image.image)
    puts @ascii.to_ascii_art
  end
end