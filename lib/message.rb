require 'colorize'
module Message

	def self.initial
		"
Welcome to
,-,-,-.           .          ,-,-,-.           . 
`,| | |   ,-. ,-. |- ,-. ,-. `,| | |   . ,-. ,-| 
  | ; | . ,-| `-. |  |-' |     | ; | . | | | | | 
  '   `-' `-^ `-' `' `-' '     '   `-' ' ' ' `-^    
".colorize(:color => :cyan, :background => :black)
	end

	def self.red
		"(r)ed".colorize(:red)
	end

	def self.green
		"(g)reen".colorize(:green)
	end

	def self.blue
		"(b)lue".colorize(:blue)
	end

	def self.yellow
		"(y)ellow".colorize(:yellow)
	end

	def self.colors
    "#{red}, #{green}, #{blue}, and #{yellow}"
  end

	def self.welcome
		"Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
	end

	def self.game_menu
		"Welcome to the main menu. Please select from the following options: (p)lay, read the (i)nstructions, or (q)uit?"
	end

	def self.instructions
		"Mastermind is a code breaking game designed in 1970 by Mordecai Meirowitz.\n\nThe object of the game is to guess the secret sequence of colors. This game includes four colors: #{colors}. Your objective is to guess the correct colors with the correct sequence. After each guess you will be given a response of how many correct color elements you have entered and how many you have in the correct position. You will use this clue to make your next educated guess.\n\nExample: The secret sequence is 1.#{green}, 2.#{blue}, 3.#{red} and 4.#{green}, which is entered as 'GBRG'.\n\nIf your guess was 'BYRG' (1. #{blue}, 2. #{yellow}, 3. #{red}, 4. #{green}).\nYou would receive the following clue:\n'BYRG' has 3 of the correct elements with 2 colors in the correct location.\n\nThe three correct elements are B, R and G. The correct colors in location R and G.\n\n\nReady to play?


		 Please presse (p)lay or (q)uit"
	end

	def self.secret_generated
		"I have generated a beginner sequence with four elements made up of: #{colors}. Use (q)uit at any time to end the game."
	end

	def self.provide_guess
		"What's your guess?"

	end

	def self.too_short
    "Guesses must consist of four colors, your guess did not provide enough colors. Please guess from the following elements: #{colors}"
  end

  def self.too_long
    "Guesses must consist of four colors, your guess provided too many color.Please guess from the following elements:#{colors}"
  end

  def self.invalid_guess
    "The colors you entered are not recoginzed in Mastermind, please enter four colors from elements #{colors}"
  end


  def self.turn_message(game_turn)
    if game_turn == 1
      "You've taken #{game_turn} guess."
    else 
      "You've taken #{game_turn} guesses."
    end
  end

  def self.quit_mid_game
  	"You have quit the game. To exit the program to enter (q)uit or you can review the (i)nstructions or (p)lay a new game."
  end

  def self.correct_location(formatted_guess, correct_colors, correct_position)
    if correct_colors == 1 
      "#{formatted_guess} has #{correct_colors} of the correct elements with #{correct_position} color in the correct location"
    else
    	"#{formatted_guess} has #{correct_colors} of the correct elements with #{correct_position} colors in the correct location"
    end
  end

  def self.see_you_soon
  	"Please play again soon!"
  end

  def self.guess_and_time(game_turn, total_time)
  	"Congratulations! You won the game in #{total_time[0]} minutes #{total_time[1]} seconds and took #{game_turn} guesses.".colorize(:color => :cyan, :background => :black)
  end

  def self.play_again?
  	"Would you like to play again? Enter (p)lay or (q)uit to exit"
  end


end