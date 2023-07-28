require_relative "hello"

RSpec.describe Hello do
  context "with default message" do
    let(:expected_message) { "Hello, world!" }

    describe "#message" do
      it "returns the default message" do
        expect(subject.message).to eq(expected_message)
      end
    end

    describe "#to_s" do
      it "returns the default message" do
        expect(subject.to_s).to eq(expected_message)
      end
    end

    describe "#sayit" do
      it "call puts with the default message" do
        expect(subject).to receive(:puts).with(expected_message)
        subject.sayit
      end

      it "outputs the default message to stdout" do
        expect { subject.sayit }.to output("#{expected_message}\n").to_stdout
      end
    end
  end
end
