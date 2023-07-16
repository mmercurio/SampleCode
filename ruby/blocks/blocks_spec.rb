# Testing implicit and explicit blocks with RSpec
require 'pry'
class ImplicitBlock
  def self.arg_and_block(arg)
    puts "ImplicitBlock: arg is #{arg.inspect}"
    yield arg
    puts "ImplicitBlock done."
  end
end

class ExplicitBlock
  def self.arg_and_block(arg, &block)
    puts "ExplicitBlock: arg is #{arg.inspect}, block is #{block.inspect}"
    block.call(arg)
    puts "ExplicitBlock done."
  end
end

class UsesBlocks
  def self.implicit_block_with_arg(arg)
    # This does not look correct, but I guess it is.
    # Implicit blocks appear combersome when passing the block to another method
    # compared to using an explicit block.
    # I wish I knew how to test this.
    ImplicitBlock.arg_and_block(arg) { yield(arg) }
  end

  def self.explicit_block_with_arg(arg, &block)
    ExplicitBlock.arg_and_block(arg, &block)
    # Coudld also be similar to implicit version:
    #   ExplicitBlock.arg_and_block(arg) { block.call(arg) }
  end
end

require "rspec"

RSpec.describe ImplicitBlock do
  let(:arg) { "hi" }

  describe "#arg_and_block" do
    it "yields the arg" do
      expect { |b| ImplicitBlock.arg_and_block(arg, &b) }.to yield_with_args(arg)
    end
  end
end

RSpec.describe ExplicitBlock do
  let(:arg) { "hi" }

  describe "#arg_and_block" do
    it "yields the arg" do
      # This is really the same as above.
      expect { |b| ExplicitBlock.arg_and_block(arg, &b) }.to yield_with_args(arg)
    end
  end
end

RSpec.describe UsesBlocks do
  let(:arg) { "hi" }
  let(:block) { proc { |a| puts a } }

  describe "#implicit_block_with_arg" do
    before do
      allow(ImplicitBlock).to receive(:arg_and_block)
    end

    it "calls ImplicitBlock with the arg and block" do
      # This is similar failure to what I'm seeing when attempting to test RakeTaskWithMetrics
      #expect(ImplicitBlock).to receive(:arg_and_block).with(arg) #{ |&blk| expect(blk).to be(block) }
      UsesBlocks.implicit_block_with_arg(arg, &block)
    end
  end

  describe "#explicit_block_with_arg" do
    before do
      allow(ExplicitBlock).to receive(:arg_and_block)
    end

    it "calls ExplicitBlock with the arg and block" do
      expect(ExplicitBlock).to receive(:arg_and_block).with(arg) { |&blk| expect(blk).to be(block) }
      UsesBlocks.explicit_block_with_arg(arg, &block)
    end
  end
end
