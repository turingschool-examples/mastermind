require './lib/prefix_calculator'

puts "Welcome to Mastermind"

input = ""
mastermind = Mastermind.new

while input != "q"
  print "> "
  input = gets.chomp
  puts mastermind.execute(input)
end
puts "Goodbye!"
