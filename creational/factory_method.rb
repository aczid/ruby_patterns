#!/usr/bin/ruby
# This example demonstrates the factory method pattern in the Ruby language.

class Product; end

class ConcreteProduct < Product; end

class Creator
	def initialize
		@product = factory_method
	end
	
	def factory_method
		return Product.new
	end

	def show_product
		puts @product.inspect
	end
end

class ConcreteCreator < Creator
	def factory_method
		return ConcreteProduct.new
	end
end

c = Creator.new
cc = ConcreteCreator.new

c.show_product
cc.show_product