#!/usr/bin/env ruby
# Fibonacci sequence!

FIB_N = 35

def benchmark(title, &block)
	puts "Executing #{title}..."
	start = Time.now
	yield
	diff = Time.now - start
	puts "Completed in #{diff} seconds."
	puts
end

# The naiive fibonacci sequence. Double recursion for double the fun!
def fib_simple(n)
	return n if n < 2
	return fib_simple(n - 1) + fib_simple(n - 2)
end

# Uses memoization! Should be much faster!
def fib_awesome(n)
	@_fibs ||= Array.new
	return n if n < 2
	return (@_fibs[n] ||= fib_awesome(n - 1) + fib_awesome(n - 2))
end

benchmark "Simple Fibonacci sequence" do
	result = fib_simple(FIB_N)
	puts "fib_simple(#{FIB_N}) = #{result}"
end

benchmark "Fibonacci sequence with caching" do
	result = fib_awesome(FIB_N)
	puts "fib_awesome(#{FIB_N}) = #{result}"
end