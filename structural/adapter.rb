#!/usr/bin/ruby
# This example demonstrates the adapter pattern in the Ruby language.


#object adapter
class Target
	def request
		return 1
	end
end

class Client
	def initialize
		@adapter = Adapter.new
	end
	
	def run
		puts @adapter.request
	end
end

class Adaptee
	def specific_request
		return 2
	end
end

class Adapter < Target
	def initialize
		@adaptee = Adaptee.new
	end
	
	def request
		return translate_response(@adaptee.specific_request)
	end
	
	def translate_response(response)
		return response-1
	end
end

c = Client.new
c.run
