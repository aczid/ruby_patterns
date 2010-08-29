#!/usr/bin/ruby

# This example demonstrates the command pattern in the Ruby language.

class Client
	def run
		@concrete_command = ConcreteCommand.new("1, 2, 3")
		@concrete_command.set_receiver(Receiver.new)
		execute_concrete_command
	end
	
	def execute_concrete_command
		Invoker.invoke(@concrete_command)
	end
end

class Receiver
	def action(args)
		puts "I'm receiving a request with parameters [#{args}]"
	end
end

class Invoker
	def Invoker.invoke(command)
		@command = command
		@command.execute
	end
end

class Command; end

class ConcreteCommand < Command
	attr_accessor :state
	
	def initialize(args)
		@args = args
	end
	
	def set_receiver(receiver)
		@receiver = receiver
	end
	
	def execute
		@receiver.action(@args)
	end
end

c = Client.new
c.run