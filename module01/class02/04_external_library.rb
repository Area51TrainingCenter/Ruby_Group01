# sudo apt-get install libmagickwand-dev
require 'asciiart'

url = "http://www.levihackwith.com/wp-content/uploads/2011/10/github-logo.png"
art = AsciiArt.new(url)
puts art.to_ascii_art(width: 50)

