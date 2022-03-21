module MyFirstModule
  def ruby_version
    system("ruby -v") # why not use RUBY_DESCRIPTION?
  end
end

class ModuleTester
  include MyFirstModule
end

mt = ModuleTester.new
mt.ruby_version
