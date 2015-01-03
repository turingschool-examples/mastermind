class Mastermind
  attr_reader   :printer, :game_in_progress
  attr_accessor :sequence

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
      @game_in_progress = true
      @sequence = ""
      4.times { @sequence += ["R", "Y", "G", "B"].sample }
      "A randon sequence has been generated\n> "
    elsif input == 'i'
      [printer.read_instructions, :continue]
    elsif input == 'q'
      [printer.quit_game, :stop]
    else
      "Invalid input. Try again.\n> "
    end
  end

  def play_game(input)
    if input == 'q'
      @game_in_progress = false
      return [printer.end_round, :continue]
    end
    guess = input.to_s
    if guess != sequence
      guess.chars.count 
      [printer.too_high, :continue]
    elsif guess == sequence
      [printer.correct_guess, :continue]
    end
  end
end
