#!/usr/bin/ruby
# This example demonstrates the state pattern in the ruby language.

class Client
	def initialize
		@context = Context.new
	end

	def set_state_a
		@context.state.set_state_a
	end

	def set_state_b
		@context.state.set_state_b
	end


	class Context
		def initialize
			@state = ConcreteStateA.new(self)
		end

		def request
			@state.handle
		end

		attr_accessor :state
	end
	
	end

class State
	def initialize(context)
		@context = context
	end
end

class ConcreteStateA < State
	def set_state_a
		puts "Error: already using state A"
	end

	def set_state_b
		@context.state = ConcreteStateB.new(@context)
		puts "Now using state B"
	end
end

class ConcreteStateB < State
	def set_state_a
		@context.state = ConcreteStateA.new(@context)
		puts "Now using state A"
	end

	def set_state_b
		puts "Error: already using state B"
	end
end

c = Client.new
c.set_state_a
c.set_state_b
c.set_state_a