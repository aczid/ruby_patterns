#!/usr/bin/ruby

# This example demonstrates the decorator pattern in the Ruby language.

class Component
	def operation
		return nil
	end
end

class ConcreteComponent < Component
	def operation
		return "I'm a concrete component "
	end
end

class Decorator < Component
	def initialize
		@component = Component.new
	end
	def operation
		@component.operation + "that has been decorated "
	end
end

class ConcreteDecoratorA < Decorator
	def initialize
		@component = ConcreteComponent.new
	end
	
	def operation
		super + "by concrete decorator A."
	end
end

class ConcreteDecoratorB < Decorator
	def initialize
		@component = ConcreteComponent.new
	end
	
	def operation
		super +  "by concrete decorator B."
	end
end

d = Decorator.new
cda = ConcreteDecoratorA.new
cdb = ConcreteDecoratorB.new
puts cda.operation
puts cdb.operation