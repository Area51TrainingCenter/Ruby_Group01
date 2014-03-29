require 'open-uri'
require 'erubis'

class BaseController
	attr_accessor :params

	def initialize(params)
		self.params = params
	end

	def render(view_name, context = {})
		layout = open("./views/layouts/application.html").read
		view = open("./views/#{self.params[:controller]}/#{view_name}.html").read

		eruby = Erubis::Eruby.new(view)

		view = eruby.evaluate(context)

		layout.gsub("{{response}}", view)
	end
end