require 'open-uri'
require 'json'

class Post
	def self.find(id)
		id = id.to_i
		JSON.parse(open("./posts/#{id}.json").read)
	end
end