require 'minitest/autorun'
require 'minitest/pride'
require './lib/score'
require './lib/secret_code'
require './lib/guess'

#Dummy Generator class to test fixed, not randomized, secret_code sequences:
class Generator
  attr_accessor :generate
  attr_reader :colors,
              :characters
  def initialize(level=:beginner)
    @colors = ['r', 'g', 'b', 'y']
  end
end

#actual score class test
class ScoreTest < Minitest::Test
  def setup
    @generator = Generator.new
    @generator.generate = ['b','r','r','b']
    @secret_code = SecretCode.new(@generator)

    @score = Score.new(@secret_code)
  end

  def test_it_exists
    score = Score.new(@secret_code)

    assert_instance_of Score, score
  end

  def test_it_counts_total_guesses
    guess1 = Guess.new('brgb', @generator)
    guess2 = Guess.new('gbry', @generator)
    guess3 = Guess.new('bryy', @generator)

    @score.guesses << guess1
    result1 = @score.total_guesses

    @score.guesses << guess2
    @score.guesses << guess3

    result2 = @score.total_guesses

    assert_equal "1 guess", result1
    assert_equal "3 guesses", result2
  end

  def test_it_checks_if_winner
    guess = Guess.new('brrb', @generator)
    @score.guesses << guess

    assert @score.winner?
  end
end
