require './lib/secret_code'
require './lib/timer'

class Score
  attr_accessor :guesses

  def initialize(secret_code)
    @secret_code = secret_code
    @guesses = []
    @timer = Timer.new
  end

  def total_guesses
    guesses = "#{@guesses.count} guesses"
    guesses = guesses.slice(0...-2) if @guesses.count == 1
    return guesses
  end

  def evaluate
    puts @secret_code.evaluate(@guesses.last)
    puts "You've taken #{total_guesses}"
  end

  def winner?
    guess = @guesses.last
    @secret_code.to_string == guess.to_string
  end

  def final_score
    return <<-HEREDOC
    Congratulations!
    You guessed the sequence #{@secret_code.to_string} in #{total_guesses} over #{@timer.total_time}.
    HEREDOC
  end
end
