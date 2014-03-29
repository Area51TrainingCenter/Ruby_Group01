require './controllers/base_controller'

class HomeController < BaseController
  def index
    puts "home controller - index action"

    render "index"
  end
end