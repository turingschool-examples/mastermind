require 'minitest/autorun'
require 'minitest/pride'
require './.lib/timer'

class TimerTest < Minitest::Test
  def test_it_exists
    timer = Timer.new

    assert_instance_of Timer, timer
  end
end
