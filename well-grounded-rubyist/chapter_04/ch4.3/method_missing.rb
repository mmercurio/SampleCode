# method_missing example
class Student
  def method_missing(m, *args)
    if m.to_s.start_with?("grade_for")
      puts "You got an A in #{m.to_s.split("_").last.capitalize}!"
    else
      super
    end
  end
end
s = Student.new
s.grade_for_english
s.something_else # raises NoMethodError
