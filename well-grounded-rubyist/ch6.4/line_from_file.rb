module TextHandler
  class InvalidLineError < StandardError
  end
end

def line_from_file(filename, substring)
  fh = File.open(filename)
  begin
    line = fh.gets
    raise TextHandler::InvalidLineError unless line.include?(substring)
  rescue TextHandler::InvalidLineError
    puts "Invalid line!"
    raise
  ensure
    fh.close # The file is always closed.
  end
  return line
end

puts "calling with 'module'"
puts line_from_file("line_from_file.rb", "module")

puts "calling with 'nosuchstring'"
puts line_from_file("line_from_file.rb", "nosuchstring")
