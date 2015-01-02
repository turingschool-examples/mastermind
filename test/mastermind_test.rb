require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/mastermind'
require_relative '../lib/printer'

class MastermindTest < Minitest::Test
  attr_reader :evaluator

  def setup
    printer    = Printer.new # only needed to pass to evaluator
    @evaluator = Mastermind.new(printer)
  end

  def test_it_exists
    assert Mastermind
  end

  def test_it_starts_a_game
    assert evaluator.number.nil?
    evaluator.execute 'p'
    assert evaluator.number.is_a? Integer
    assert (1..5).include? evaluator.number
  end

  def test_read_instructions
    evaluator.execute 'i'
    message, signal = evaluator.execute 'i'
    assert message.include? 'How to Play MASTERMIND'
    assert_equal signal, :continue
  end

  def test_guess_is_too_high
    evaluator.execute 'p'
    evaluator.number = 5
    message, signal = evaluator.execute '10'
    assert message.include? "too high"
    assert_equal signal, :continue
  end

  def test_guess_is_too_low
    evaluator.execute 'p'
    evaluator.number = 5
    message, signal = evaluator.execute '1'
    assert message.include? "too low"
    assert_equal signal, :continue
  end

  def test_guess_is_correct
    evaluator.execute 'p'
    evaluator.number = 5
    message, signal = evaluator.execute '5'
    assert message.include? "You won!"
    assert_equal signal, :continue
  end

  def test_quit_game_completely
    message, signal = evaluator.execute 'q'
    assert message.include? 'Thanks for playing!'
    assert_equal signal, :stop
  end

  def test_quit_game_round
    evaluator.execute 'p'
    message, signal = evaluator.execute 'q'
    assert message.include? 'You ended the round.'
    assert_equal signal, :continue
  end
end
