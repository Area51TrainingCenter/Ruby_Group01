class Duck
 def talk
  puts "quack!"
 end
end
 
class Cow
 def talk
  puts "mooo!"
 end
 
 def get_milk
  puts "Mooo! You've got now milk"
 end
end
 
class Mouse
 def talk
  puts "squeak!"
 end
end
 
def give_me_something
  animals = [Duck, Mouse, Cow]
  animals[rand(2).new]
end
 
 
some_variable = give_me_something
 
some_variable.talk
 
some_variable.get_milk if some_variable.respond_to? :get_milk