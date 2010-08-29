#!/usr/bin/ruby

# This example demonstrates the facade pattern in the Ruby language.

class Facade
	def initialize
		@subsystems = [ConcreteSubsystemOne.new, ConcreteSubsystemTwo.new]
	end
	
	def start_subsystems
		returnstring = ""
		for subsystem in @subsystems
			returnstring += subsystem.start
		end
		return returnstring
	end
	
	def stop_subsystems
		returnstring = ""
		for subsystem in @subsystems
			returnstring +=  subsystem.stop
		end
		return returnstring
	end
end

class Subsystem
	def start
		return self.name + " started" + "\n"
	end

	def stop
		return self.name + " stopped" + "\n"
	end
end

class ConcreteSubsystemOne < Subsystem
	attr_accessor :name
	def initialize
		@name = "Subsystem One"
	end
end

class ConcreteSubsystemTwo < Subsystem
	attr_accessor :name
	def initialize
		@name = "Subsystem Two"
	end
end

class Client
	def run
		facade = Facade.new
		puts facade.start_subsystems
		sleep 1
		puts facade.stop_subsystems
	end
end

c = Client.new
c.run
