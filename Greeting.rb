BEGIN {
	puts "Static initializer starting."
}

END {
	puts "This runs at the end of processing"
}

class Greeter
	attr_accessor :names

	def initialize(names = "World")
		@names = names
	end

	def hello
		if @names.nil? # is null
			puts "..."
		elsif @names.respond_to?("each") # is an iterator
			@names.each do |name|
				puts "Fuck off, #{name}!" # error in tutorial ruby-lang.org/.../quickstart/3
			end
		else # is singular
			puts "Fuck off, #{@names}!"
		end
	end

	def bye
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("join")
			puts "Bite me, #{@names.join(", ")}. And Stay Away, ya wanker!"
		else
			puts "Eat shit, #{@names}. Get the fuck outta here!"
		end
	end

	def print_multiline
		print <<EOF
		This prints a multiline
		statement.
EOF

		print <<"EOF"; # exactly the same as above
		This also prints a multiline
		statement.
EOF

		print <<`EOC` # execute commands
		echo "First echoed message."
		echo "Second echoed message." # Why is this not printing?
EOC

		print <<"first", <<"second" # stacked
		I said foo.
first
		I said bar.
second
	end
end

if __FILE__ == $0
	g = Greeter.new
=begin
	g.hello
	g.bye

	g.names = "Asshole"
	g.hello
	g.bye

	g.names = ["Jerkface", "Dipshit", "Blunderbus", "Arsehole"]
	g.hello
	g.bye

	g.names = nil
	g.hello
	g.bye
=end

	g.print_multiline
end
