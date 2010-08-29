#!/usr/bin/ruby
# This example demonstrates the abstract factory pattern in the Ruby language.

class AbstractProduct; end

class ConcreteProduct < AbstractProduct
	def initialize
		@type = "Concrete"
	end
end

class AbstractFactory
	def get_product
		return AbstractProduct.new
	end
end

class ConcreteFactory < AbstractFactory
	def get_product
		return ConcreteProduct.new
	end
end

class Client
	@product = AbstractProduct.new
	def initialize(factory)
		@product = factory.get_product
	end
	
	def show_product
		puts @product.inspect
	end
end

cfc = Client.new(ConcreteFactory.new)
cfc.show_product
