require 'pp'
require 'open-uri'

class App
  attr_accessor :status, :headers, :response, :routes

  def initialize
    self.response = ""
    self.headers = {
      'Content-Type' => 'text/html'
    }
    self.status = 200
    self.routes = {
      get: {},
      post: {}
    }
  end

  def get(route, controller_action)
    self.routes[:get][route] = controller_action
  end

  def post(route, controller_action)
    self.routes[:post][route] = controller_action
  end

	def call(env)
    path = env["PATH_INFO"].split('/')

    if env["REQUEST_METHOD"] == "GET"
      if self.routes[:get].include?(env["PATH_INFO"])
        controller_action = self.routes[:get][env["PATH_INFO"]]

        controller, action = controller_action.split('#')

        require "./controllers/#{controller}_controller"

        klass_name  = "#{controller.capitalize}Controller"
        controller_klass = Object.const_get(klass_name)
        pp controller_klass
        # "home_controller"
        # klass_name => "HomeController"
        # controller = controller_action.split('#')[0]
        # action = controller_action.split('#')[1]

        pp "controller_action: #{controller_action}"
      end
      pp self.routes[:get]
    elsif env["REQUEST_METHOD"] == "POST"
      pp self.routes[:post]
    end

		if path.last.to_s.include?(".css")
			self.headers['Content-Type'] = 'text/css'
			self.status = 200

			begin
				self.response = open("./assets/#{path.last}").read
			rescue Exception => e
				self.response = ""
				self.status = 404
			end
		end

    if path.last.to_s.include?(".png")
      self.headers['Content-Type'] = 'image/png'
      self.status = 200

      begin
        self.response = open("./assets/#{path.last}").read
      rescue Exception => e
        self.response = ""
        self.status = 404
      end
    end

    # http://reference.sitepoint.com/html/mime-types-full

		to_response
	end

	def to_response
		if self.headers['Content-Type'] == "text/html"
			layout = "<!DOCTYPE html><html><head><link href=\"/assets/styles.css\" rel=\"stylesheet\" media=\"all\" /></head><body>{{response}}</body></html>"
			self.response = layout.gsub("{{response}}", self.response)
		end

		[ self.status, self.headers, [ self.response ] ]
	end
end