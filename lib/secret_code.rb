require './lib/generator'
require 'pry'

class SecretCode
  def initialize(generator)
    @generator = generator
    @sequence = @generator.generate
    @colors = @generator.colors
  end

  def to_string
    return "'#{@sequence.join.upcase}'"
  end

  def elements(guess)
    matching = @colors.map do |color|
      [@sequence.count(color), guess.count(color)].min
    end
    matching.reduce(:+)
  end

  def positions(guess)
    combined = @sequence.zip(guess)
    combined.count do |colors|
      colors[0] == colors[1]
    end
  end

  def evaluate(guess)
    elements = "#{elements(guess.sequence)} of the correct elements"
    positions = "#{positions(guess.sequence)} in the correct position"
    return "#{guess.to_string} has #{elements} and #{positions}"
  end
end
