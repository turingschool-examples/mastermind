class Generator
  attr_reader :colors,
              :characters,
              :level

  def initialize(level='beginner')
    @colors = ['r', 'g', 'b', 'y']
    @levels = {'beginner'=>4, 'intermediate'=>6, 'advanced'=>8}
    @level = level
    @characters = @levels[@level]
  end

  def generate
    sequence = []
    @characters.times do
      sequence << @colors.sample
     end
     sequence
  end
end
