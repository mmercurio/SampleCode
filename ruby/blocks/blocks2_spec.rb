# simplified version of implementation and specs for
# code which takes a block and then calls another method (to be mocked)
# that also takes a block

# The challenge is testing:
#  1. the method that takes a block
#  2. the block itself, when the block is called

require "pry"
class ApiTakingBlock
  # This represents an API to be mocked that takes a block and will be
  # called from the code under test.

  def self.define(name, &block)
    ApiTakingBlock.new(name, &block)
  end

  def initialize(name, &block)
    @name = "ApiWithBlock:#{name}"
    @block = block
  end

  def invoke
    puts "invoking block=#{@block.inspect} with name=#{@name}"
    @block.call(@name)
  end
end

class AnotherApiWithBlock
  # This is yet a different API that takes a block and will be called from the
  # code under test and will be mocked.
  def self.do_something(name, &block)
    # Does some stuff which doesn't really matter
    # ... and eventually calls the block with the name as an arg
    block.call(name)
    binding.pry # We don't actually want to get here. Becuase this should be mocked.
  end
end

# Code that will be tested with RSpec
class CodeUnderTest
  def self.define(name, &block)
    ApiTakingBlock.define(name) do |name|
      puts "*** inside block #{name}"
      do_thing(name, &block)
    end
  end

  def self.do_thing(name, &block)
    AnotherApiWithBlock.do_something(name, &block)
  end
end

require "rspec"

RSpec.describe CodeUnderTest do
  let(:name) { "test_name" }
  let(:block) do
    proc do |name|
      puts "#{name}: working... "
      puts "#{name}: done."
    end
  end

  let(:api_taking_block) { instance_double(ApiTakingBlock, name) }

  describe "#define" do

    subject { CodeUnderTest.define(name, &block) }

    before do
      # This appears to work: https://stackoverflow.com/a/21739326/1368979
      allow(ApiTakingBlock).to receive(:define).with(name).and_yield(name)
      allow(AnotherApiWithBlock).to receive(:do_something).with(name).and_yield(name)
    end

    it "creates the ApiTakingBlock instance" do
      expect(ApiTakingBlock).to receive(:define).with(name).and_yield(name)
      subject
    end

    it "it calls AnotherApiWithBlock to do something" do
      expect(AnotherApiWithBlock).to receive(:do_something).with(name).and_yield(name)
      subject
    end
  end
end
