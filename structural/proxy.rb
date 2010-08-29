#!/usr/bin/ruby
# This example demonstrates the proxy pattern in the Ruby language.

class Subject
	def request
		
	end
end

class Proxy < Subject
	def request
		RealSubject.new.request
	end
end

class RealSubject < Subject
	def request
		return 1	
	end
end

class Client
	def run
		proxy = Proxy.new
		puts proxy.request
	end
end

client = Client.new
client.run