require './lib/message'
require 'time'


class Mastermind
	attr_reader :secret, :color_selector

	def initialize 
		@color_selector = ["r", "g", "b", "y"]
		@secret = nil
		
	end

  def execute(input)
    if input == 'i' || input == "instructions"
      puts Message.instructions
    elsif input == 'p' || input == "play"
    	@time_start = Time.now
    	@game_turn = 1
    	play
    else
      puts Message.see_you_soon
    end
  end

  def play
  	puts Message.secret_generated
  	secret_generator
    guess = ""
    while guess
    	puts Message.provide_guess
		  print "> "
		  guess = gets.chomp.downcase
			  if guess == "q" || guess == 'quit'
			  	puts Message.quit_mid_game
			  	return
			  elsif guess == @secret.join("")
			  	timer
			  	puts Message.guess_and_time(@game_turn, @total_time)
			  	break
			  else
			  valid_guess(guess)
				end
				@game_turn += 1
		end
		puts Message.play_again?
  end

  def timer
  	@time_finish = Time.now
  	times =[]
  	time_differ = (@time_finish - @time_start)
  	 times = time_differ.divmod(60)
  	@minutes = times[0]
  	@seconds = times[1].round
  	@total_time = [@minutes, @seconds]
  end

  def secret_generator
  	@secret = []
    count = 0 
    until count == 4
      @secret << @color_selector.sample 
      count +=1 
    end
    p @secret
  end

  def valid_guess(guess)
  	guesser = guess.length
	case 
  	when guesser < 4 then puts Message.too_short
    when guesser > 4 then puts Message.too_long   
    when guesser == 4
      guess.downcase!
      guess = guess.chars
      valid_guess = guess.all?{ |color| color.match(/[rgby]/)}
       if valid_guess == true
       	evaluate(guess)
     		else 
      puts Message.invalid_guess
    end
    end
  end

  def evaluate(guess)
  	correct_elements(guess)
  	correct_positions(guess)
    formatted_guess = guess.join("").upcase
    puts Message.correct_location(formatted_guess, @correct_colors, @correct_positions)
    puts Message.turn_message(@game_turn)
  end

  def correct_elements(guess)
  	correct_colors = 0
  	@color_selector.each do |n|
	    if @secret.count(n) >= guess.count(n)
	      correct_colors += guess.count(n)
	    elsif @secret.count(n) < guess.count(n)
	      correct_colors += @secret.count(n)
	    end
  	end
    @correct_colors = correct_colors
  end

  def correct_positions(guess)
  	correct_positions_combiner = @secret.zip(guess)
    correct_positions = correct_positions_combiner.count { |secret, guess| secret == guess}
    @correct_positions = correct_positions
	end  

 end

 



