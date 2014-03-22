require 'pp'

run proc { |env|
	pp env

	path = env["PATH_INFO"].split('/')

	if path[0] == ""
		path.shift
	end

	pp path

	response = ""

	if path[0] == "posts"
		if path[1].to_s == ""
			response = "<h1>Mi blog</h1>"
		else
			response = "<h1>#{path[1].gsub('-', ' ')}</h1>"
		end
	end

	[200, { 'Content-Type' => 'text/html' }, [response]]
}

# "localhost:9292/posts/123-mi-primer-post"