require './lib/message'


class Mastermind
	attr_reader :secret

	def initialize 
		@color_selector = ["r", "g", "b", "y"]
		@secret = nil
		@game_turn = 1
	end

  def execute(input)
    
    if input == 'i' || input == "instructions"
      puts Message.instructions
    elsif input == 'p' || input == "play"
    	puts "you are playing"
    	play

    else
      puts Message.see_you_soon
    end
  end

    def play
    	puts Message.secret_generated
    	 @secret = []
      count = 0 
      until count == 4
        @secret << @color_selector.sample 
        count +=1 
      end
      p @secret
     
      guess = ""
      while guess
      	puts Message.provide_guess
			  print "> "
			  guess = gets.chomp.downcase
				  # if guess == @secret.join("")
				  if guess == "q" || guess == 'quit'
				  	puts Message.quit_mid_game
				  	return
				  elsif guess == @secret.join("")
				  	puts "winner"
				  	break
				  else
				  valid_guess(guess)
					end
					@game_turn += 1
			end
			puts "test"
    end

    def guess_config(guess)
    	guess.upcase!
      guess = guess.chars
    end

    def valid_guess(guess)
    	guesser = guess.length
  	case 
  	
  	when guesser < 4
      puts Message.too_short
      
    when guesser > 4
      puts Message.too_long
       
    when guesser == 4
      guess.downcase!
      guess = guess.chars
      valid_guess = guess.all?{ |color| color.match(/[rgby]/)}
      evaluate(guess) if valid_guess == true
     else 
        puts Message.invalid_guess
  
         
      end
    end

    def evaluate(guess)
    	correct_colors = 0

    @color_selector.each do |n|
      if @secret.count(n) >= guess.count(n)
        correct_colors += guess.count(n)
      elsif @secret.count(n) < guess.count(n)
        correct_colors += @secret.count(n)
      end
      @correct_colors = correct_colors
    end
    correct_positions_combiner = @secret.zip(guess)
    correct_positions = correct_positions_combiner.count { |secret, guess| secret == guess}
    @correct_positions = correct_positions
   
    formatted_guess = guess.join("").upcase

    puts Message.correct_location(formatted_guess, @correct_colors, @correct_positions)
    puts Message.turn_message(@game_turn)

  
    	
    end

    def format_guess(guess)
    	formatted_guess = guess.join("").upcase
    end


  #   def correct_color?(guess)
		# correct_colors = 0
  #   @color_selector.each do |n|
  #     if @secret.count(n) >= guess.count(n)
  #       correct_colors += guess.count(n)
  #     elsif @secret.count(n) < guess.count(n)
  #       correct_colors += @secret.count(n)
  #     end
  #   end
  #   @correct_colors = correct_colors
  # end

  # def correct_positions?(guess)
  # 	correct_positions_combiner = @secret.zip(guess)
  #   correct_positions = correct_positions_combiner.count { |secret, guess| secret == guess}
  # end
 end

 



