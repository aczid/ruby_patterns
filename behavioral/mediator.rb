#!/usr/bin/ruby
# This example demonstrates the mediator pattern in the Ruby language.

class Mediator
	def initialize
		@colleagues = Hash.new
	end
end

class Colleague
	def initialize(id)
		@id = id
		@mediator = nil
	end
	
	def register_mediator(mediator)
		@mediator = mediator
	end
	
	def get_id
		return @id
	end
	
	def send(id, message)
		puts "Sending message from " + @id + " to " + id + ": " + message
		@mediator.send(id, message)
	end
	
	def receive(message)
		puts "Message received by " + @id + ": " + message
	end
end

class ConcreteMediator < Mediator
	def register_colleague(colleague)
		colleague.register_mediator(self)
		@colleagues[colleague.get_id] = colleague
	end
	
	def send(id, message)
		@colleagues[id].receive(message)
	end
end

class ConcreteColleague1 < Colleague
end

class ConcreteColleague2 < Colleague
end

class Client
	def run
		alice = Colleague.new("alice")
		bob = Colleague.new("bob")
		chip = Colleague.new("chip")
		
		m = ConcreteMediator.new
		m.register_colleague(alice)
		m.register_colleague(bob)
		m.register_colleague(chip)
		
		alice.send("bob", "Hi bob!")
		bob.send("chip", "Hi chip, alice said hi!")
	end
end

c = Client.new
c.run