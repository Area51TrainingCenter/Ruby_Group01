require 'open-uri'

web_site = open("http://google.com")

puts web_site.base_uri
puts web_site.content_type

web_site.each_line do |line|
  puts line
end
