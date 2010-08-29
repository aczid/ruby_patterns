#!/usr/bin/ruby
# This example demonstrates the strategy pattern in the ruby language.

class Context 
	attr_accessor :strategy
	def initialize
		@strategy = ConcreteStrategy.new
	end
	
	def do(*args)
		@strategy.do(*args)
	end
end

class Strategy
	def do(*args)
	end
end

class ConcreteStrategy < Strategy
	def do(*args)
		puts "ConcreteStrategy called with arguments " + args.join(', ')
	end
end

c = Context.new
c.do(1,2,3)