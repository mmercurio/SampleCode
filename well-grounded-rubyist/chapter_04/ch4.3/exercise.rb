require_relative "person"

e = Person.new("Eric B.")
r = Person.new("Rakim")
e.has_friend(r)
e.has_hobby("cycling")
r.has_hobby("drums")

def people_with_hobbies(hobby)
  Person.all_with_hobbies(hobby).each do |person|
    puts "#{person.name} is into #{hobby}."
  end
end

people_with_hobbies("cycling")
people_with_hobbies("drums")
