#!/usr/bin/ruby
# This example demonstrates the iterator pattern in the Ruby language.

class Iterator
	def first
		@container[0]
	end
	
	def next_item
		nextitem = @container[@index]
		@index += 1
		return nextitem
	end
	
	def is_done
		if @index == @container.size
			return true
		else
			return false
		end
	end
	
	def current_item
		return @container[@index]
	end
	
	def initialize(container)
		@container = container
		@index = 0
	end

end

class ConcreteIterator < Iterator
end

class Agregate < Array
	def create_iterator
		return Iterator.new(self)
	end
	
	def add_item(item)
		push item
	end
end

class ConcreteAgregate < Agregate
	def create_iterator
		return ConcreteIterator.new(self)
	end
end

class Client
	def run
		ca = ConcreteAgregate.new
		ca.add_item("item1")
		ca.add_item("item2")
		ca.add_item("item3")
		
		iterator = ca.create_iterator
		while not iterator.is_done
			puts iterator.next_item
		end
	end
end

c = Client.new
c.run