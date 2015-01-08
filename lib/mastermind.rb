require 'pry'

class Mastermind
  attr_reader   :printer, :guess, :game_in_progress, :guesses_taken
  attr_accessor :sequence

  def initialize(printer)
    @printer = printer
    @game_in_progress = false
    @guesses_taken = 0
    @sequence = ""
  end

  def execute(input)
    @input = input
    @guess = input.upcase.to_s
    return game_menu unless game_in_progress
    play_game
  end

  private

  def input
    @input ||= ""
    @input.downcase
  end

  def game_menu
    return generate_sequence if input =~ /p.*/
    return [printer.read_instructions, :continue] if input =~ /i.*/
    return [printer.quit_game, :stop] if input =~ /q.*/
    [printer.invalid_input, :continue]
  end

  def play_game
    return [printer.end_round, :continue] if end_round?
    return [printer.invalid_input, :continue] unless valid_input?
    game_status
  end

  def generate_sequence
    @game_in_progress = true
    4.times { @sequence << ["R", "Y", "G", "B"].sample }
    printer.sequence_generated
  end

  def game_status
    if guess != sequence
      correct_chars = correct_chars(guess, sequence)
      correct_position = correct_position(guess, sequence)
      @guesses_taken += 1
      return [printer.incorrect_guess(guess, correct_chars, correct_position, guesses_taken), :continue]
    end
    game_won
  end

  def game_won
    @game_in_progress = false
    [printer.correct_guess, :continue]
  end

  def valid_input?
    return true if guess =~ /[RGBY]{4}/
  end

  def end_round?
    if input == "q" || input == "quit"
      @game_in_progress = false
      return true
    end
  end

  def correct_chars(guess, sequence)
    sequence.chars.each.reduce(0) do |sum, char|
      sum + guess.chars.uniq.count(char)
    end
  end

  def correct_position(guess, sequence)
    count = 0
    guess.chars.each_with_index do |char, index|
      count += 1 if char == sequence[index]
    end
    count
  end
end
