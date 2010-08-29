#!/usr/bin/ruby
# This example demonstrates the memento pattern in the Ruby language.

class Originator
	def initialize
		@state = self.inspect
	end
	
	def set_memento(memento)
		@state = memento.get_state
	end
	
	def create_memento
		return Memento.new(@state)
	end
end

class Memento
	def initialize(state)
		@state = state
	end
	
	def get_state
		return @state
	end
	
	def set_state(state)
		@state = state
	end
end

class Caretaker
	def initialize
		@savedstates = Array.new
	end

	def add_memento(memento)
		@savedstates.push(memento)
	end
	
	def get_memento(id)
		return @savedstates[id]
	end
	
end

class Client
	def initialize
		@caretaker = Caretaker.new
		@originator = Originator.new
	end
	
	def run
		@caretaker.add_memento(@originator.create_memento)
		puts @caretaker.inspect
		
	end
end

cff = Client.new
cff.run