require './lib/secret_code'
require './lib/guess'
require './lib/score'

class Game
  attr_accessor :generator

  def initialize
    @generator = Generator.new
  end

  def start
    @secret_code = SecretCode.new(@generator)
    @score = Score.new(@secret_code)
    greet
    guess
    play
  end

  def greet
    puts  <<-HEREDOC
    "I have generated an #{@generator.level} sequence with #{@generator.characters} elements made up of:
    (r)ed, (g)reen, (b)lue, and (y)ellow.

    Use (c)heat at any time to see the answer or (q)uit to end the game.

    What's your guess?
    HEREDOC
  end

  def guess
    print '>'
    response =translate(gets)
    if response.length == 1
      menu(response)
    else
      @guess = Guess.new(response, @generator)
      check_guess
    end
  end

  def check_guess
    if @guess.valid?
      @score.guesses << @guess
    else
      puts @guess.find_error
      guess
    end
  end

  def play
    until @score.winner?
      @score.evaluate
      guess
    end
    end_game
  end

  def valid_player_words
    menu_options = ['quit', 'cheat', 'instructions', 'play']
    color_names = ['yellow', 'red', 'green', 'blue']
    menu_options.concat(color_names)
  end

  def translate(response)
    response = response.downcase.gsub(/[^a-z]/, '')
    valid_player_words.each do |word|
      response = response.gsub(word, word[0])
    end
    response
  end

  def menu(response)
    case response
    when 'q' then quit
    when 'i' then instructions
    when 'c' then cheat
    when 'p' then start
    else not_valid
    end
  end

  def instructions
    instructions = File.read("./data/instructions.txt")
    puts instructions
    guess
  end

  def quit
    puts 'Goodbye'
  end

  def cheat
    puts @secret_code.to_string
    guess
  end

  def not_valid
    puts 'That is not a valid option'
    guess
  end


  def end_game
    puts @score.final_score
    puts "Do you want to (p)lay again or (q)uit?"
    print ">"
    response = translate(gets)
    menu(response)
  end
end
