#!/usr/bin/ruby

# This example demonstrates the composite pattern in the Ruby language.

class Component
	def operation
	end
	
	def add_component
	end
	
	def remove_component
	end
	
	def get_children
	end
end

class Leaf < Component
	def operation
		
	end
end

class Composite < Component
	def initialize
		@children = []
	end
	
	def add_component(component)
		@children += [component]
	end
	def remove_component(int)
		@children.delete(int)
	end
	
	def get_child(int)
		return @children[int]
	end
end


class Client
	attr_accessor :composite
	def initialize
		@composite = Composite.new
	end
	def run
		@composite.add_component(Leaf.new)
		@composite.add_component(Leaf.new)
		c = Composite.new
		c.add_component(Leaf.new)
		c.add_component(Leaf.new)
		c.add_component(Leaf.new)
		@composite.add_component(c)
		@composite.add_component(Leaf.new)
		@composite.remove_component(1)
	end
end

c = Client.new
c.run
puts c.composite.inspect