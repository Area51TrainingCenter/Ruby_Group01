# encoding: UTF-8 

print "¿Que operación quieres hacer? "
operator = gets.chomp

print "¿Cuál es el valor inicial? "
number_1 = gets.chomp.to_i

print "¿Cuál es el segundo valor? "
number_2 = gets.chomp.to_i

operation = case operator
              when "SUMA"
                "+"
              when "RESTA"
                "-"
              when "DIVIDE"
                "/"
              when "MULTIPLICA"
                "*"
              else 
                "invalido"
            end

unless number_2.respond_to? operation
  puts "No es una operación válida" 
else
  puts number_1.send(operation,number_2)
end