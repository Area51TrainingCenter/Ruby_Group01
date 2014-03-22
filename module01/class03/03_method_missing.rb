require 'open-uri'
require 'json'

class Instagram
	CLIENT_ID = "4f4063bc66cf4c0cb6754b11d44014b6"

	def self.tag_recent_media(tag)
		url = "https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=#{CLIENT_ID}"

		response = open(URI.parse(url)).read

		JSON.parse(response)['data'].map do |media_attributes|
			InstagramMedia.new(media_attributes)
		end
	end
end

class SuperHash
	def initialize(hash)
		@hash = hash
	end

	def method_missing(method_name)
		if @hash.keys.include?(method_name.to_s)
			value = @hash[method_name.to_s]

			if value.is_a? Hash
				SuperHash.new(value)
			else
				value
			end
		else
			super
		end
	end
end

class InstagramMedia < SuperHash
	# attr_accessor :attributes
	# def initialize(attributes)
	# 	self.attributes = attributes
	# end

	# def method_missing(method_name)
	# 	if @attributes.keys.include?(method_name.to_s)
	# 		@attributes[method_name.to_s]
	# 	else
	# 		super
	# 	end
	# end

	# def likes
	# 	@attributes['likes']
	# end

	# def tags
	# 	@attributes['tags']
	# end

	# def comments
	# 	@attributes['comments']
	# end

	# def images
	# 	@attributes['images']
	# end
end

# class Hash
# 	def method_missing(method_name)
# 		if self.keys.include?(method_name.to_s)
# 			self[method_name.to_s]
# 		else
# 			super
# 		end
# 	end
# end