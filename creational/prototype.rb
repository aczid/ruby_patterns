#!/usr/bin/ruby
# This example demonstrates the prototype pattern in the Ruby language.

class Prototype
	attr_accessor :type
	def initialize
		@type = "Abstract"
	end
	
	def print
		puts "This prototype is #{@type}"
	end
end
class Client
	def initialize
		@prototype = Prototype.new
	end
	
	def operation
		@concrete_prototype1 = @prototype.clone
		@concrete_prototype1.type = "Concrete Prototype 1"
	
		@concrete_prototype2 = @prototype.clone
		@concrete_prototype2.type = "Concrete Prototype 2"
			
		@prototype.print
		@concrete_prototype1.print
		@concrete_prototype2.print
	end
end

c = Client.new
c.operation