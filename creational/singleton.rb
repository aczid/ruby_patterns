#!/usr/bin/ruby
# This example demonstrates the singleton pattern in the ruby language.

require "singleton"

class ExampleSingleton
	include Singleton
	attr_accessor :var
	
	def initialize
		@var = nil
	end
end

e1 = ExampleSingleton.instance
e2 = ExampleSingleton.instance

e1.var = "set"

if e1 === e2
	puts "e1 and e2 are the same object!"
end