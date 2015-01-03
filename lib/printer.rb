class Printer

  def welcome_message
    "\nWelcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
  end

  def read_instructions
    "How to Play MASTERMIND:\n
        1. Choosing (p)lay will generate a random, four element sequence made up
           of: (R)ed, (G)reen, (B)lue, and (Y)ellow.\n
        2. You must then guess the sequence. Valid characters only include R,G,B,Y.\n
        3. After each guess, Mastermind will tell you how close you are to the
           the sequence by telling you how many elements you have correct in
           your sequence as well as if any of the elements are in the correct
           position. So, if the sequence was BBGB and you typed RGRB, Mastermind
           would tell you: 'RGRB' has 2 correct elements and 1 correct position.\n
        4. Keep guessing until you get it! I believe in you!\n> "
  end

  def too_high
    "Your guess is too high\n> "
  end

  def correct_guess
    "You won!\n> "
  end

  def quit_game
    "Thanks for playing!\n"
  end

  def end_round
    "You ended the round.\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
  end
end
