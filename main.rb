require_relative "game"
require_relative "result_printer"
require_relative "word_reader"

puts "Игра виселица.\n\n"

printer = ResultPrinter.new
reader = WordReader.new

current_path = File.dirname(__FILE__)
slovo = reader.read_from_file(current_path + "/data/words.txt")

game = Game.new(slovo)

while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
