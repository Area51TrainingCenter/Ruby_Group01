require './app'

my_app = App.new

my_app.get("/", "home#index")

run my_app

# "localhost:9292/posts/123-mi-primer-post"