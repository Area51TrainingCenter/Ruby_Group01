require 'pp'
require 'open-uri'

class App
  attr_accessor :status, :headers, :response, :routes

  def initialize
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
    current_path = env["PATH_INFO"]

    if current_path =~ /\/$/
      current_path = current_path.gsub(/(.*)\/$/, "\\1")
    end

    self.response = ""
    self.headers = {
      'Content-Type' => 'text/html'
    }
    self.status = 200

    if env["REQUEST_METHOD"] == "GET"
      if self.routes[:get].include?(current_path)
        controller_action = self.routes[:get][current_path]

        controller_name, action_name = controller_action.split('#')

        params = {
          controller: controller_name,
          action: action_name
        }

        require "./controllers/#{controller_name}_controller"

        klass_name  = "#{controller_name.capitalize}Controller"
        controller_klass = Object.const_get(klass_name)
        controller = controller_klass.new(params)
        # "home_controller"
        # klass_name => "HomeController"
        # controller = controller_action.split('#')[0]
        # action = controller_action.split('#')[1]

        pp "controller_action: #{controller_action}"
        self.response = controller.send(action_name.to_sym)
      end
      pp self.routes[:get]
    elsif env["REQUEST_METHOD"] == "POST"
      pp self.routes[:post]
    end

		if current_path.include?(".css")
			self.headers['Content-Type'] = 'text/css'
			self.status = 200

			begin
				self.response = open("./assets/#{current_path.split('/').pop}").read
			rescue Exception => e
				self.response = ""
				self.status = 404
			end
		end

    if current_path.include?(".png")
      self.headers['Content-Type'] = 'image/png'
      self.status = 200

      begin
        self.response = open("./assets/#{current_path.split('/').pop}").read
      rescue Exception => e
        self.response = ""
        self.status = 404
      end
    end

    # http://reference.sitepoint.com/html/mime-types-full

		to_response
	end

	def to_response
		[ self.status, self.headers, [ self.response ] ]
	end
end