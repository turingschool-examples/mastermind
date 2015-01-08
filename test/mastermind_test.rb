require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
require './lib/printer'

class MastermindTest < Minitest::Test
  attr_reader :mastermind

  def setup
    printer     = Printer.new # only needed to pass to mastermind
    @mastermind = Mastermind.new(printer)
  end

  def test_it_exists
    assert Mastermind
  end

  def test_it_starts_a_game
    assert mastermind.sequence.nil?
    mastermind.execute "p"
    mastermind.sequence.chars.each do |char|
      assert ["R", "G", "B", "Y"].include? char
    end
  end

  def test_it_validates_menu_input
    message, signal = mastermind.execute "r"
    assert message.include? "Invalid"
    assert_equal signal, :continue
  end

  def test_it_validates_game_input
    message = mastermind.execute "p"
    mastermind.sequence = "RGBG"
    message, signal = mastermind.execute "BVDF"
    assert message.include? "Invalid"
    assert_equal signal, :continue
  end

  def test_read_instructions
    message, signal = mastermind.execute "i"
    assert message.include? "How to Play MASTERMIND"
    assert_equal signal, :continue
  end

  def test_guess_is_wrong
    mastermind.execute "play"
    mastermind.sequence = "RGBG"
    message, signal = mastermind.execute "RGRR"
    assert message.include? "correct Elements"
    assert_equal signal, :continue
  end

  def test_guess_is_correct
    mastermind.execute "p"
    mastermind.sequence = "RGBY"
    message, signal = mastermind.execute "RGBY"
    assert message.include? "You won"
    assert_equal signal, :continue
  end

  def test_quit_game_completely
    message, signal = mastermind.execute "q"
    assert message.include? "Thanks for playing!"
    assert_equal signal, :stop
  end

  def test_quit_game_round
    mastermind.execute "p"
    message, signal = mastermind.execute "q"
    assert message.include? "You ended the round."
    assert_equal signal, :continue
  end
end
