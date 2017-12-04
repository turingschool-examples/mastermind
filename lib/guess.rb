class Guess
  attr_reader :sequence

  def initialize(player_guess, generator)
    @sequence = player_guess.split('')
    @colors = generator.colors
    @characters = generator.characters
  end

  def to_string
    "'#{@sequence.join.upcase}'"
  end

  def too_long?
    @sequence.length > @characters
  end

  def too_short?
    @sequence.length < @characters
  end

  def all_colors?
    @sequence.all? do |color|
      @colors.include?(color)
    end
  end

  def valid?
    @sequence.length == @characters && all_colors?
  end

  def find_error
    return 'not all valid colors' if !all_colors?
    return 'too short' if too_short?
    return 'too long' if too_long?
  end
end
