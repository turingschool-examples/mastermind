require "minitest/autorun"
require "minitest/pride"
require "./lib/generator"

class GeneratorTest < Minitest::Test

  def test_it_exists
    generator = Generator.new

    assert_instance_of Generator, generator
  end

  def test_it_generates_a_sequence_of_4_letters
    generator = Generator.new

    result = generator.generate

    colors = ['r', 'g', 'b', 'y']
    all_colors = result.all? do |color|
      colors.include?(color)
    end

    assert_equal 4, result.length
    assert_equal String, result.first.class
  end

  def test_it_has_colors
    generator = Generator.new

    result = generator.colors

    assert Array, result.class
  end

  def test_it_generates_a_sequence_only_from_the_color_letters
    generator = Generator.new
    colors = generator.colors

    result = generator.generate
    all_colors = result.all? do |color|
      colors.include?(color)
    end

    assert colors.include?(result.first)
    assert all_colors
  end
end
