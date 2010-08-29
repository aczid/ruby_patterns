#!/usr/bin/ruby
# This example demonstrates the interpreter pattern in the Ruby language.

class Context < Array
	def initialize
	end
end

class Client
	def initialize
		@abstract_syntax_tree = Array.new
	end
	
	def interpret(expression)
		@abstract_syntax_tree = Parser.new(expression).evaluate
		return @abstract_syntax_tree
	end
	
	def inspect_syntax_tree
		puts @abstract_syntax_tree.inspect
	end
end

class Parser
	def initialize(expression)
		@syntax_tree = []
		@context = Context.new
		token_id = 0
		expressions_list = expression.split
		
		while token_id < expressions_list.size
			token = expressions_list[token_id]
			if(token == "+")
				next_token = expressions_list[token_id + 1]
				if(next_token.to_i.is_a?(Integer))
					@syntax_tree += [TerminalExpression_Plus.new(next_token)]
					token_id += 1
				end
			elsif(token == "-")
				next_token = expressions_list[token_id + 1]
				if(next_token.to_i.is_a?(Integer))
					@syntax_tree += [TerminalExpression_Minus.new(next_token)]
					token_id += 1
				end
			elsif(token == "*")
				next_token = expressions_list[token_id + 1]
				if(next_token.to_i.is_a?(Integer))
					@syntax_tree += [TerminalExpression_Times.new(next_token)]
					token_id += 1
				end
			elsif(token == "/")
				next_token = expressions_list[token_id + 1]
				if(next_token.to_i.is_a?(Integer))
					@syntax_tree += [TerminalExpression_Divide.new(next_token)]
					token_id += 1
				end
			elsif(token.to_i.is_a?(Integer))
				@syntax_tree += [TerminalExpression_Integer.new(token)]
			elsif(token.is_a?(String))
				if(token == "if")
					@syntax_tree += [NonterminalExpression.new]
				elsif(token == "while")
					@syntax_tree += [NonterminalExpression_While.new]
				end
			end
			token_id += 1
		end
	end
	
	def evaluate
		for expression in @syntax_tree
			expression.interpret(@context)
		end
		return @context.pop
	end
end

class AbstractExpression
	def interpret(context)
	end
end

class TerminalExpression_Integer < AbstractExpression
	def initialize(expression)
		@integer = expression.to_i
	end
	
	def interpret(context)
		context.push(@integer)
	end
end

class TerminalExpression_Plus < AbstractExpression
	def initialize(expression)
		@integer = expression.to_i
	end

	def interpret(context)
		last = context.pop()
		if (last.is_a?(Integer))
			last += @integer
		end
		context.push(last)
	end
end

class TerminalExpression_Minus < AbstractExpression
	def initialize(expression)
		@integer = expression.to_i
	end

	def interpret(context)
		last = context.pop()
		if (last.is_a?(Integer))
			last -= @integer
		end
		context.push(last)
	end
end

class TerminalExpression_Times < AbstractExpression
	def initialize(expression)
		@integer = expression.to_i
	end

	def interpret(context)
		last = context.pop()
		if (last.is_a?(Integer))
			last = last * @integer
		end
		context.push(last)
	end
end

class TerminalExpression_Divide < AbstractExpression
	def initialize(expression)
		@integer = expression.to_i
	end

	def interpret(context)
		last = context.pop()
		if (last.is_a?(Integer))
			last = last / @integer
		end
		context.push(last)
	end
end


c = Client.new
puts c.interpret("1 * 1 + 1 - 1 / 1").inspect