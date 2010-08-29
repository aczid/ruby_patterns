#!/usr/bin/ruby
# This example demonstrates the flyweight pattern in the Ruby language.

class Flyweight; end

class ConcreteCharacterFlyweight < Flyweight
	attr_accessor :intrinsic_state
	def to_s
		self.intrinsic_state[:character]
	end

	def initialize(character, font_face, size)
		@intrinsic_state = { :character => character, :font_face => font_face, :size => size }
	end
end

class UnsharedConcreteScentenceFlyweight < Flyweight
	attr_accessor :all_state
	def to_s
		self.all_state[:character]
	end

	def initialize(character)
		@all_state += character
	end
end

class FlyweightFactory
	def initialize
		@flyweights = Hash.new
	end
	
	def get_num
		return @flyweights.size
	end
end

class ConcreteCharacterFlyweightFactory < FlyweightFactory	
	def get_flyweight(character, font_face, size)
		key = character.to_s + font_face.to_s + size.to_s
		if not @flyweights[key]
			@flyweights[key] = ConcreteCharacterFlyweight.new(character, font_face, size)
		end
		return @flyweights[key]
	end
end

class Client
	def initialize(factory)
		@flyweight_factory = ConcreteCharacterFlyweightFactory.new
		@flyweights = []
		
	end
	
	def run
		flyweight = @flyweight_factory.get_flyweight('T', "Arial", 15)
		@flyweights.push(flyweight)
		flyweight = @flyweight_factory.get_flyweight('E', "Arial", 15)
		@flyweights.push(flyweight)
		flyweight = @flyweight_factory.get_flyweight('S', "Arial", 15)
		@flyweights.push(flyweight)
		flyweight = @flyweight_factory.get_flyweight('T', "Arial", 15)
		@flyweights.push(flyweight)

		@flyweights.each {|char| print char.to_s}
		print "\n"

		puts @flyweight_factory.get_num.to_s + " flyweights used."
	end
end

c = Client.new(ConcreteCharacterFlyweightFactory.new)
c.run