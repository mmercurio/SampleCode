class Rainbow
  include Enumerable
  def each
    yield "red"
    yield "orange"
    yield "yellow"
    yield "green"
    yield "blue"
    yield "indigo"
    yield "violet"
  end
end

r = Rainbow.new
r.each do |color|
  puts "Next color: #{color}"
end
# Next color: red
# Next color: orange
# Next color: yellow
# Next color: green
# Next color: blue
# Next color: indigo
# Next color: violet
#  => nil

y_color = r.find {|color| color.start_with?('y') }
puts "First color starting with 'y' is #{y_color}."
# First color starting with 'y' is yellow.

# What other methods does Enumerable have to offer?
p Enumerable.instance_methods(false).sort
#  => [:all?, :any?, :chain, :chunk, :chunk_while, :collect, :collect_concat, :count,
#      :cycle, :detect, :drop, :drop_while, :each_cons, :each_entry, :each_slice,
#      :each_with_index, :each_with_object, :entries, :filter, :filter_map, :find,
#      :find_all, :find_index, :first, :flat_map, :grep, :grep_v, :group_by, :include?,
#      :inject, :lazy, :map, :max, :max_by, :member?, :min, :min_by, :minmax, :minmax_by,
#      :none?, :one?, :partition, :reduce, :reject, :reverse_each, :select, :slice_after,
#      :slice_before, :slice_when, :sort, :sort_by, :sum, :take, :take_while, :tally,
#      :to_a, :to_h, :to_set, :uniq, :zip]

# The `false`` argument in call to `instance_methods` says to only return the methods
# defined in the `Enumerable` module itself.
# https://ruby-doc.org/core-2.7.5/Module.html#method-i-instance_methods
