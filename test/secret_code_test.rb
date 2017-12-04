require 'minitest/autorun'
require 'minitest/pride'
require './lib/secret_code'
require './lib/guess'

#Dummy Generator class to test fixed, not randomized, secret_code sequences:
class Generator
  attr_accessor :generate

  def initialize(level=:beginner)
    @colors = ['r', 'g', 'b', 'y']
  end
end

#Actual test class:
class SecretCodeTest < Minitest::Test

  def test_it_exists
    generator = Generator.new
    secret_code = SecretCode.new(generator)

    assert_instance_of SecretCode, secret_code
  end

  def test_sequence_from_generator_can_change_into_a_string
    generator = Generator.new
    generator.generate = ['g','r','b','r']
    secret_code = SecretCode.new(generator)

    result = secret_code.to_string

    assert_equal "'GRBR'", result
  end

  def test_it_evaluates_a_guess_sequence_for_correct_colors
    generator = Generator.new
    generator.generate = ['y','y','g','r']
    secret_code = SecretCode.new(generator)
    guess1 = ['y','b','g','r']
    guess2 = ['r','r','r','y']
    guess3 = ['g','g','r','b']

    result1 = secret_code.elements(guess1)
    result2 = secret_code.elements(guess2)
    result3 = secret_code.elements(guess3)

    assert_equal 3, secret_code.elements(guess1)
    assert_equal 2, secret_code.elements(guess2)
    assert_equal 2, secret_code.elements(guess3)
  end

  def test_it_evaluates_a_guess_sequence_for_correct_colors_in_correct_position
    generator = Generator.new
    generator.generate = ['g','r','y','b']
    secret_code = SecretCode.new(generator)
    guess1 = ['y','y','r','r']
    guess2 = ['g','b','g','b']
    guess3 = ['b','y','y','r']

    result1 = secret_code.positions(guess1)
    result2 = secret_code.positions(guess2)
    result3 = secret_code.positions(guess3)

    assert_equal 0, result1
    assert_equal 2, result2
    assert_equal 1, result3
  end

  def test_it_evaluates_a_guess
    generator = Generator.new
    generator.generate = ['r','y','r','r']
    secret_code = SecretCode.new(generator)
    guess1 = Guess.new('yygg')
    guess2 = Guess.new('yyrr')
    guess3 = Guess.new('ybbr')

    result1 =secret_code.evaluate(guess1)
    expected1 = "'YYGG' has 1 of the correct elements and 1 in the correct position"
    result2 = secret_code.evaluate(guess2)
    expected2 = "'YYRR' has 3 of the correct elements and 3 in the correct position"
    result3 = secret_code.evaluate(guess3)
    expected3 = "'YBBR' has 2 of the correct elements and 1 in the correct position"

    assert_equal expected1, result1
    assert_equal expected2, result2
    assert_equal expected3, result3
  end
end
