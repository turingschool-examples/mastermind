require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/generator'

class GuessTest < Minitest::Test
  def setup
    @generator = Generator.new(level=:beginner)
  end

  def test_it_exists
    guess = Guess.new('rrby', @generator)

    assert_instance_of Guess, guess
  end

  def test_it_turns_a_string_into_a_sequence_of_colors
    guess = Guess.new('bgry', @generator)

    result = guess.sequence

    assert_equal Array, result.class
  end

  def test_it_checks_if_too_long
    guess = Guess.new('bbgryr', @generator)
    second_guess = Guess.new('yrbg', @generator)

    assert guess.too_long?
    refute second_guess.too_long?
  end

  def test_it_checks_if_too_short
    guess = Guess.new('yr', @generator)
    second_guess = Guess.new('brrg', @generator)

    assert guess.too_short?
    refute second_guess.too_short?
  end

  def test_it_checks_if_sequence_is_all_colors
    guess = Guess.new('rggb', @generator)
    second_guess = Guess.new('rhby', @generator)

    assert guess.all_colors?
    refute second_guess.all_colors?
  end

  def test_it_checks_if_guess_is_valid
    guess = Guess.new('rgfusciag', @generator)
    second_guess = Guess.new('bbbb', @generator)

    refute guess.valid?
    assert second_guess.valid?
  end

  def test_it_finds_the_error_if_not_valid
    guess = Guess.new('r', @generator)
    second_guess = Guess.new('rgbrr', @generator)
    third_guess = Guess.new('rhgg', @generator)

    assert_equal 'too short', guess.find_error
    assert_equal 'too long', second_guess.find_error
    assert_equal 'not all valid colors', third_guess.find_error
  end
end
