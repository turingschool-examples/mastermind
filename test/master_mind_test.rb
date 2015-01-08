require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
require './lib/message'

class MastermindTest < Minitest::Test

  
  def test_it_exists
    assert MastermindTest
  end

  def test_it_displays_instructions
    mm = Mastermind.new
    result = mm.execute("i")
    assert Message.instructions, result
  end

  def test_quit_takes_you_to_menu
    mm = Mastermind.new
    result = mm.execute("q")
    assert Message.see_you_soon, result
  end


  def test_secret_is_random
    skip
    mm1 = Mastermind.new
    result1 = mm1.execute("p")
    secret1 = mm1.play
    mm2 = Mastermind.new
    result2 = mm2.execute("p")
    secret2 = mm2.play
    valid = secret1 == secret2
    refute valid
  end



  def test_it_checks_if_guess_is_too_short
    mm = Mastermind.new
    checker = mm.valid_guess("rgb")
    assert Message.too_short, checker
  end

  def test_it_checks_if_guess_is_too_long
    mm = Mastermind.new
    checker = mm.valid_guess("rgbrb")
    assert Message.too_long, checker
  end

  def test_it_checks_it_guess_input_are_valid_colors
    mm = Mastermind.new
    checker = mm.valid_guess("help")
    assert Message.invalid_guess, checker
  end

  def test_it_checks_the_number_of_correct_colors
    mm = Mastermind.new
    
    assert_equal 3, checker
  end


  def test_it_wins
    mm = Mastermind.new
    result = mm.execute("bbgb")

    assert result.include?("win")
  end
end