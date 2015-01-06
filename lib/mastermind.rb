class Mastermind
  attr_reader   :printer, :game_in_progress
  attr_accessor :sequence

  def initialize(printer)
    @printer = printer
    @game_in_progress = false
  end

  def execute(input)
    return game_menu(input) unless game_in_progress
    play_game(input)
  end

  def game_menu(input)
    input = input.downcase
    if input == "p" || input == "play"
      @game_in_progress = true
      @sequence = ""
      4.times { @sequence << ["R", "Y", "G", "B"].sample }
      "A randon sequence has been generated\n> "
    elsif input == "i" || input == "instructions"
      [printer.read_instructions, :continue]
    elsif input == "q" || input == "quit"
      [printer.quit_game, :stop]
    else
      "Invalid input. Try again.\n> "
    end
  end

  def play_game(input)
    input = input.downcase
    if input == "q" || input == "quit"
      @game_in_progress = false
      return [printer.end_round, :continue]
    end

    guess = input.upcase.to_s
    @sequence = sequence.upcase

    unless guess == sequence
      correct_elements = sequence.chars.each.reduce(0) do |sum, char|
        sum + guess.chars.uniq.count(char)
      end
      correct_position = 0
      guess.chars.each_with_index do |char, index|
        if char == sequence[index]
          correct_position += 1
        end
      end
      # print "#{guess} has #{correct_elements} correct Elements with #{correct_position} in the correct position\n> "
      return [printer.incorrect_guess(guess, correct_elements, correct_position), :continue]
    end
    @game_in_progress = false
    [printer.correct_guess, :continue]
  end
end
