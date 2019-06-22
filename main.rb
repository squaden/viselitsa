
require_relative "game.rb"
require_relative "result_printer.rb"
require_relative "word_reader.rb"

current_path = File.dirname(__FILE__)

printer = ResultPrinter.new

puts "Игра виселица.\n\n"

reader = WordReader.new

slovo = reader.read_from_file(current_path + "/data/words.txt")

game = Game.new(slovo)

while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
