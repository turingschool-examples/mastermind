class Mastermind
  def execute(input)
    secret = "BBGB"
    if input == secret
      "You win!"
    else
      "Guess again!"
    end
  end
end
