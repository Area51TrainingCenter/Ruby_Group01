require 'pp'
require 'open-uri'

class App
	def call(env)
		@env = env

		pp env

		path = env["PATH_INFO"].split('/')

		if path[0] == ""
			path.shift
		end

		path ||= []

		pp path

		response = ""
		headers = {
			'Content-Type' => 'text/html'
		}
		status = 200

    # "/posts/123-mi-primer-post"

		if path[0] == "posts"
			if path[1].to_s == ""
				response = "<h1>Mi blog</h1>"
			else
				id = path.last.to_i

				begin
					response = open("./posts/#{id}.html").read
				rescue Exception => e
					response = "Post no encontrado"
					status = 404
				end
			end
		end

		if path.last.to_s.include?(".css")
			headers['Content-Type'] = 'text/css'
			status = 200

			begin
				response = open("./assets/#{path.last}").read
			rescue Exception => e
				response = ""
				status = 404
			end
		end

    if path.last.to_s.include?(".png")
      headers['Content-Type'] = 'image/png'
      status = 200

      begin
        response = open("./assets/#{path.last}").read
      rescue Exception => e
        response = ""
        status = 404
      end
    end

		to_response(status, headers, response)
	end

	def to_response(status, headers, response)
		if headers['Content-Type'] == "text/html"
			layout = "<!DOCTYPE html><html><head><link href=\"/assets/styles.css\" rel=\"stylesheet\" media=\"all\" /></head><body>{{response}}</body></html>"
			response = layout.gsub("{{response}}", response)
		end

		[status, headers, [response]]
	end
end