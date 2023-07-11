BEGIN {
	puts "Static initializer starting."
}

END {
	puts "This runs at the end of processing"
}

class Greeter
	attr_accessor :names
	attr_accessor :foobar # instance variable; starts with @

	@@class_name = "Greeter" # class variable; starts with @@

	$global_name = "This is weird" # global variable; available everywhere?; starts with $

	def initialize(names = "World", foobar = "foo")
		puts "initialize(#{names}, #{foobar})"
		@names = names
		@foobar = foobar
	end

	def hello # method names should be all lowercase
		puts "hello()"
		message = "Fuck Off" # local variable within method; starts with underscore or letter
		if @names.nil? # is null
			puts "..."
		elsif @names.respond_to?("each") # is an iterator
			@names.each do |name|
				puts "#{message}, #{name}!" # error in tutorial ruby-lang.org/.../quickstart/3
			end
		else # is singular
			puts "#{message}, #{@names}!"
		end
	end

	def bye
		puts "bye()"
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("join")
			puts "Bite me, #{@names.join(", ")}. And Stay Away, ya wanker!"
		else
			puts "Eat shit, #{@names}. Get the fuck outta here!"
		end
	end

	def print_multiline
		puts "print_multiline()"
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
		ls
		ls -la
EOC

		print <<"first", <<"second" # stacked
		I said foo.
first
		I said bar.
second
	end

	def instanceVar
		puts "instanceVar()"
		puts @foobar
		@foobar = "bar"
		puts @foobar
	end

	def classVar
		puts "This is #{@@class_name}. Global variable is #{$global_name}."
	end
end

class Nerf
	def print_global_variable
		puts "Global variable is #{$global_name}."
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

	# g.print_multiline

	# g.instanceVar

	g2 = Greeter.new(foobar = "bar")
	# g2.foobar = "bar"
	# g2.instanceVar

	g.classVar

	g2.classVar

	n = Nerf.new
	n.print_global_variable
end
