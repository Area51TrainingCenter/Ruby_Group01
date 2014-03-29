require './controllers/base_controller'
require './models/post'

class PostsController < BaseController
  def index
    puts "home controller - index action"

    render "index"
  end

  def show
  	@post = Post.find(123)
  	render "show", { post: @post }
  end
end