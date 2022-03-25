#!/usr/bin/env ruby

print "Hello. Please enter a Celsius value: "
celsius = gets.to_i
fahrenheit = (celsius * 9 / 5) + 32
puts "The Fahrenheit equivalent is #{fahrenheit}."
