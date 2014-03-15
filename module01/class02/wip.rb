class Array

	def my_each
		for i in self
			yield(i)
		end
	end

	def my_map
		array = []
		self.my_each do |item|
			array << yield(item) #4
		end
		array
	end

	def lala
	end

end

[1, 2, 3].my_map{|item| item*2 }
#=> [2, 4, 4]

class LaserPrinter
	def print(num_pages)
		puts yield
	end
end

class 3DPrinter
	def print(num_pages, &block)
		puts block.call
	end
end



class ReporterPrinter

	def print(printer, num_pages, &block)
		printer.new.print(num_pages, block)
	end

end

reporter = ReporterPrinter.new
reporter.print(3DPrinter, 12) do
	"REPORTE".center(100, "*")
end


def parser(params)
	options = {timeout: 10, try: 20}
	options.merge!(params)

	timeout = params.delete(:timeout)
	try     = params.delete(:try)
	do_stuff(params)
end

params = {timeout: 15}
parser params








class Person

	attr_accessor :name, :age, :etc, :gender, :address
	attr_reader :salary
	attr_writer :address

	def initialize(name, age, salary, etc)
		@name 	= name
		@age  	= age
		@salary = salary
		@etc    = etc
	end

	def age
		@age - 5
	end

end

alvaro = Person.new("Alvaro", 29, 1000, id: 110, months: 12, siblings: 1, phrase: "lala")



class UserDecorator

	def initialize(user)
		@user = user
	end

	def age
		if user.age == 1
			"#{@user.age} AÑO"
		else
			"#{@user.age} AÑOS"
		end
	end

end



user_decorator.age







class Milk
end

class Refrigerator

  attr_accessor :products

  def initialize
    @products = []
  end

  def +(value)
    @products << value
  end

  def -(value)
    @products.delete(value)
  end

  def open
    @products
  end

end

refri = Refrigerator.new 
refri + Milk.new




[12].each do |i|
 puts i
end

[12].each_with_index do |item, index|
 puts i
end


require 'instagram'
Instagram

require 'asciiart'
AsciiArt





File.open("filename", "w+") do |file|
	file.write "alalal"
end

file = File.open("filename", "w+")
file.write "lalala"
file.close

class File
	def my_open(filename, permissions)
		file = File.open(filename, permissions)
		yield(file)
		file.close
	end
end


test = File.read("filename")







class Employee < Person
end

coo = Employee.new

















