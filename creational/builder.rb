#!/usr/bin/ruby
# This example demonstrates the builder pattern in the Ruby language.

# this is a prototype
class Product
	def initialize
		@number = nil
		@colour = nil
	end
	
	def set_colour(colour)
		@colour = colour
	end
	
	def set_number(number)
		@number = number
	end
end

class Builder
	def initialize
		@product = Product.new
	end
	
	def build_colour
		part = "grey"
	end
	def build_number
		part = 0
	end
	
	def get_result
		return @product
	end
end

class BlueSevensBuilder < Builder
	def build_colour
		@product.set_colour("blue")
	end
	def build_number
		@product.set_number(7)
	end
	
end

class RedThreesBuilder < Builder
	def build_colour
		@product.set_colour("red")
	end
	def build_number
		@product.set_number(3)
	end
	
end

class Director
	def initialize(builder)
		@builder = builder
	end
	def construct
		@builder.build_colour
		@builder.build_number
	end
	
	def get_result
		return @builder.get_result
	end
end

bsd = Director.new(BlueSevensBuilder.new)
rtd = Director.new(RedThreesBuilder.new)
bsd.construct
rtd.construct

puts bsd.get_result.inspect
puts rtd.get_result.inspect