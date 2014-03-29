require './app'

my_app = App.new

my_app.get("/", "home#index")
my_app.get("/posts", "posts#index")
my_app.get("/posts/123", "posts#show")

run my_app

# "localhost:9292/posts/123-mi-primer-post"