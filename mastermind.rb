require './lib/game'

game = Game.new

puts 'Welcome to MASTERMIND'

puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
print '>'
response = game.translate(gets)
game.menu(response)
