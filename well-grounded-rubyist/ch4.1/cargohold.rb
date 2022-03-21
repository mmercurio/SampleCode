require_relative "stacklike"

class Suitecase
end

class CargoHold
  include Stacklike
  def load_and_report(obj)
    print "Loading object "
    puts obj.object_id
    add_to_stack(obj)
  end
  def unload
    take_from_stack
  end
end
ch = CargoHold.new
sc1 = Suitecase.new
sc2 = Suitecase.new
sc3 = Suitecase.new
ch.load_and_report(sc1)
ch.load_and_report(sc2)
ch.load_and_report(sc3)
first_unloaded = ch.unload
print "The first suitecase off the lane is..."
puts first_unloaded.object_id
