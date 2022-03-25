#!/usr/bin/env ruby

INPUT_FILE = 'temp.dat'
OUTPUT_FILE = 'temp.out'

def f2c(fahrenheit)
  ((fahrenheit - 32) * 5) / 9
end

puts "Reading Fahrenheit temperature values from data file '#{INPUT_FILE}'..."
lines = File.new(INPUT_FILE).readlines

puts "Saving result to output file '#{OUTPUT_FILE}'"
fh = File.new("temp.out", "w")
lines.each { |line| fh.puts f2c(line.to_i) }

fh.close
