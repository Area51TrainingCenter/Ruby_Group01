require 'pp'
require 'open-uri'

class App
	def call(env)
		@env = env

		path = env["PATH_INFO"].split('/')

		if path[0] == ""
			path.shift
		end

		pp path

		response = ""
		status = 200

		if path[0] == "posts"
			if path[1].to_s == ""
				response = "<h1>Mi blog</h1>"
			else
				response = "<h1>#{path[1].gsub('-', ' ')}</h1>"
			end
		end

		id = path.last.to_i

		begin
			response = open("./posts/#{id}.html").read
		rescue Exception => e
			response = "Post no encontrado"
			status = 404
		end

		to_response(status, response)
	end

	def to_response(status, response)
		layout = "<!DOCTYPE html><html><head></head><body>{{response}}</body></html>"
		response = layout.gsub("{{response}}", response)
		[status, { 'Content-Type' => 'text/html' }, [response]]
	end
end