require './lib/mastermind'

class Runner
  def run
    puts "Welcome to Mastermind"

    mastermind = Mastermind.new
    response = nil

    until response && response.status == :won
      print "> "
      input = gets.chomp
      response = mastermind.execute(input)
      puts response.message
    end
    puts "Goodbye!"
  end
end
