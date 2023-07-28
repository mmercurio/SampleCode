class Hello
  DEFAULT_MESSAGE = "Hello, world!".freeze

  attr_reader :message

  def initialize(message = DEFAULT_MESSAGE)
    @message = message
  end

  def sayit
    puts @message
  end

  def to_s
    @message
  end
end
