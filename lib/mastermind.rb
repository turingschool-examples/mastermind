require 'pry'

class Mastermind
  attr_reader   :printer, :guess, :in_progress, :start_time, :end_time
  attr_accessor :sequence, :guesses_taken

  def initialize(printer)
    @printer = printer
    @in_progress = false
  end

  def execute(input)
    @input = input
    @guess = input.upcase.to_s
    return menu unless in_progress
    play_game
  end

  private

  def input
    @input ||= ""
    @input.downcase
  end

  def menu
    return generate_sequence if input =~ /p.*/
    return [printer.read_instructions, :continue] if input =~ /i.*/
    return [printer.quit_game, :stop] if input =~ /q.*/
    [printer.invalid_input, :continue]
  end

  def play_game
    return [printer.end_round, :continue] if end_round?
    return [printer.invalid_input, :continue] unless valid_input?
    status
  end

  def generate_sequence
    @in_progress = true
    @start_time = Time.now
    @guesses_taken = 0
    @sequence = ""
    4.times { @sequence << ["R", "Y", "G", "B"].sample }
    printer.sequence_generated
  end

  def status
    return [printer.lost_game, :continue] if lost?
    return keep_guessing unless finished?
    player_wins
  end

  def keep_guessing
    correct_chars = correct_chars(guess, sequence)
    correct_position = correct_position(guess, sequence)
    @guesses_taken += 1
    return [printer.incorrect_guess(guess, correct_chars, correct_position, guesses_taken), :continue]
  end

  def player_wins
    @in_progress = false
    end_time
    [printer.correct_guess(end_time), :continue]
  end

  def lost?
    if @guesses_taken == 10
      @in_progress = false
      return true
    end
  end

  def end_time
    @end_time = Time.now - start_time
    mm, ss = @end_time.divmod(60)
    "%d minutes and %d seconds" % [mm, ss]
  end

  def finished?
    guess == sequence
  end

  def valid_input?
    return true if guess =~ /[RGBY]{4}/
  end

  def end_round?
    if input == "q" || input == "quit"
      @in_progress = false
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
