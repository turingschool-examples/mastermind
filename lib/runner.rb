require 'pry'
require './lib/message' 
require './lib/mastermind'

puts Message.initial
puts Message.game_menu

input = ""
mastermind = Mastermind.new

while input != "q"
  print "> "
  input = gets.chomp
  puts mastermind.execute(input)
end
puts "Goodbye!"