class Mastermind
  attr_reader   :printer, :game_in_progress
  attr_accessor :number

  def initialize(printer)
    @printer = printer
    @game_in_progress = false
  end

  def execute(input)
    if !game_in_progress
      game_menu(input)
    else
      play_game(input)
    end
  end

  def game_menu(input)
    if input == 'p'
      @number = rand(1..5)
      @game_in_progress = true
    elsif input == 'i'
      [printer.read_instructions, :continue]
    elsif input == 'q'
      [printer.quit_game, :stop]
    end
  end

  def play_game(input)
    if input == 'q'
      return [printer.end_round, :continue]
    end
    guess = input.to_i
    if guess > number
      [printer.too_high, :continue]
    elsif guess < number
      [printer.too_low, :continue]
    elsif guess == number
      [printer.correct_guess, :continue]
    end
  end
end
