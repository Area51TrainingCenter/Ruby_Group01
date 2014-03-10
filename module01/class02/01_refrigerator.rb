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

class Milk
end

class Laptop
end

class Juice
end

# Create a new container
refri = Refrigerator.new

# Add some products
refri + Milk.new
refri + Juice.new

# Let's look inside
puts refri.open.inspect

# Add one more
laptop = Laptop.new 

refri + laptop

# Wait, we can't freeze that
puts refri.open.inspect

# Now we are talking
refri - laptop

# All right
puts refri.open.inspect

