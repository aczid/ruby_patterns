#!/usr/bin/ruby
# This example demonstrates the bridge pattern in the Ruby language.

class Abstraction
	def initialize
		@imp = Implementor.new
	end
	def operation
		return @imp.operation_imp
	end
end

class RefinedAbstraction < Abstraction
	def initialize
		@imp = ConcreteImplementorA.new
	end
	
	def operation
		return "Calling operation on " + super
	end
end

class Implementor
	def operation_imp
		return nil
	end
end

class ConcreteImplementorA < Implementor
	def operation_imp
		return "concrete implementor"
	end
end

ra = RefinedAbstraction.new
puts ra.operation