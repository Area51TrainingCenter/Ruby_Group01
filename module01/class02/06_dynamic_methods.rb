require 'asciiart'
require "instagram"
require 'flickr'
require 'pp'

CLIENT_ID = "4f4063bc66cf4c0cb6754b11d44014b6"
FLICKR_API_KEY = "b872f152d394d2062eae38a04664434f"

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
  # http://www.flickr.com/services/apps/create/
  def initialize(index = 0)
    flickr = Flickr.new(FLICKR_API_KEY)
    @media = flickr.photos[index]
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