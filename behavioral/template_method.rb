#!/usr/bin/ruby
# This example demonstrates the template method pattern in the ruby language.

class AbstractClass
	def template_method
		puts "Sum total of primitive operations is " + (primitive_operation_1 + primitive_operation_2).to_s
	
	end
	
	def primitive_operation_1
	end
	
	def primitive_operation_2
	end
end

class ConcreteClass < AbstractClass
	def primitive_operation_1
		return 1
	end

	def primitive_operation_2
		return 2
	end
end

cc = ConcreteClass.new
cc.template_method