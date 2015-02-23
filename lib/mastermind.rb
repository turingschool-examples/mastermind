require_relative 'response'

class Mastermind
  def execute(input)
    secret = "BBGB"
    if input == secret
      Response.new(:message => "You Win!", :status => :won)
    else
      Response.new(:message => "Guess again!", :status => :continue)
    end
  end
end
