#!/usr/bin/ruby
# This example demonstrates the chain of responsibility pattern in the Ruby language.

class Client
	def initialize
		@handler = ConcreteHandler_Integer.new
	end
	
	def run
		@handler.handle_request("string")
		@handler.handle_request(1)
	end
	
end

class Handler
	def initialize
	end
	
	def handle_request(something)
		return nil
	end
end

class ConcreteHandler_Integer < Handler
	def initialize
		@successor = ConcreteHandler_String.new
	end
	
	def handle_request(int)
		if int.is_a? Integer
			puts "This is an integer!"
		else
			@successor.handle_request(int)
		end
	end
end

class ConcreteHandler_String < Handler
	def handle_request(string)
		if string.is_a? String
			puts "This is a string!"
		end
	end
end

c = Client.new
c.run