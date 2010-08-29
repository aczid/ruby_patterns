#!/usr/bin/ruby
# This example demonstrates the visitor pattern in the Ruby language.

class Visitor
	def visit_concrete_element_a(element)
	end
	
	def visit_concrete_element_b(element)
	end

end

class ConcreteVisitor < Visitor
	def visit_concrete_element_a(element)
		element.operation_a
	end
	
	def visit_concrete_element_b(element)
		element.operation_b
	end 
end

class Element
	def accept(visitor)
		
	end
end

class ConcreteElementA < Element
	def accept(visitor)
		visitor.visit_concrete_element_a(self)
	end
	
	def operation_a
		puts 'Concrete operation A called'
	end
end

class ConcreteElementB < Element
	def accept(visitor)
		visitor.visit_concrete_element_b(self)
	end
	
	def operation_b
		puts 'Concrete operation B called'
	end
end

class ObjectStructure < Array
end

class Client
	def initialize
		@struct = ObjectStructure.new
		@visitor = ConcreteVisitor.new
	end
	
	def run
		@struct.push(ConcreteElementA.new)
		@struct.push(ConcreteElementB.new)
		
		@struct.each {|element| element.accept(@visitor)}
	end
end

c = Client.new
c.run