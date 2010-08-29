#!/usr/bin/ruby

# This example demonstrates the observer pattern in the ruby language.
# It wil loop ten times, notifying the ConcreteObserver object of any changes
# that occur in the ConcreteObservable object.


require "observer"

class ConcreteObservable
	include Observable
	
	def run
		10.times do 
			change = rand(100)
			changed
			notify_observers(change)
			sleep 1
		end
	end
end

class ConcreteObserver
	def initialize(observable, change)
		@lastChange = change
		observable.add_observer(self)
	end
	def update(change)
		if change != @lastChange
			print "A change has occurred! Current value is #{change}
"
		end
	end
end

example = ConcreteObservable.new
ConcreteObserver.new(example, 100)
example.run
