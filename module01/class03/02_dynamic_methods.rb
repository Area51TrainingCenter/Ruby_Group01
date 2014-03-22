class Object
	def self.my_attr_accessor(*args)
		args.each do |arg|
			define_method(arg.to_sym) do
				instance_variable_get("@#{arg}".to_sym)
			end
		end
	end
end

class Book
	# attr_accessor :title, :price, :description, :publisher
	def title
		@title
	end

	def title=(value)
		@title = value
	end
end