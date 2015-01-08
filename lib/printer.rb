require 'colorize'

class Printer

  def welcome_message
    "\nWelcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
  end

  def read_instructions
    "How to Play MASTERMIND:\n
        1. Choosing (p)lay will generate a random, four element sequence made up
           of: (R)ed, (G)reen, (B)lue, and (Y)ellow.\n
        2. You must then guess the sequence in 10 turns or less. Valid characters only include R,G,B,Y.\n
        3. After each guess, Mastermind will tell you how close you are to the
           the sequence by telling you how many elements you have correct in
           your sequence as well as if any of the elements are in the correct
           position. So, if the sequence was BBGB and you typed RGRB, Mastermind
           would tell you: 'RGRB' has 2 correct elements and 1 correct position.\n
        4. Keep guessing until you get it! I believe in you!\n> "
  end

  def sequence_generated
    "A beginner sequence has been generated with 4 elements made up of:\n(#{"R".red})ed, (#{"Y".yellow})ellow, (#{"B".blue})lue, and (#{"G".green})reen.\nUse (q)uit at any time to end the round.\nWhat's your guess?\n> "
  end

  def correct_guess(end_time, guess)
    "Correct! #{colorize(guess)} was the sequence!\nYou won in #{end_time}\nWould you like to (p)lay again, read the (i)nstructions, or (q)uit?\n> "
  end

  def incorrect_guess(guess, correct_elements, correct_position, guesses_taken)
    "#{colorize(guess)} has #{correct_elements} correct Elements with #{correct_position} in the correct Position\nNumber of guesses taken: #{guesses_taken}\n> "
  end

  def invalid_input
    "Invalid input. Try again\n> "
  end

  def lost_game
    "You lost the game by running out of guesses.\nWould you like to (p)lay again?\n> "
  end

  def quit_game
    "Thanks for playing!\n"
  end

  def end_round
    "You ended the round.\nWould you like to (p)lay again, read the (i)nstructions, or (q)uit?\n> "
  end

  def colorize(sequence)
    sequence.split("").map { |letter| color_it(letter) }.join("")
  end

  def color_it(letter)
    case letter
    when "R" then letter.red
    when "G" then letter.green
    when "B" then letter.blue
    when "Y" then letter.yellow
    end
  end
end
