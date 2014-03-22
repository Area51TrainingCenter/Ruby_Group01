class Object
	def self.my_attr_accessor(*args)
		args.each do |arg|
			# arg : title, price, description, publisher
			define_method(arg.to_sym) do
				instance_variable_get("@#{arg}".to_sym)
			end

			# arg : title=, price=, description=, publisher=
			define_method("#{arg}=".to_sym) do |value|
				instance_variable_set("@#{arg}".to_sym, value)
			end
			# def title=(value)
			#   @title = value
			# end
		end
	end
end

class Book
	# attr_accessor :title, :price, :description, :publisher
	my_attr_accessor :title, :price, :description, :publisher
	
	def title
		@title
	end

	def title=(value)
		@title = value
	end
end