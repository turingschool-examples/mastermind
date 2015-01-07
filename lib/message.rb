module Message

	def self.colors
    "(r)ed,(g)reen, (b)lue, and (y)ellow"
  end

	def self.welcome
		"Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
	end

	def self.game_menu
		"Welcome to the main menu. Please select from the following options: (p)lay, read the (i)nstructions, or (q)uit?"
	end

	def self.instructions
		"Here is how to play... Please presse (p)lay or (q)uit"
	end

	def self.secret_generated
		"I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
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


end