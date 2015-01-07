require './lib/printer'
require './lib/mastermind'

printer = Printer.new
evaluator = Mastermind.new(printer)

print printer.welcome_message
signal = :continue

until signal == :stop
  input = gets.chomp
  message, signal = evaluator.execute(input)
  print message
end
