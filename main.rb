require 'unicode_utils/upcase'

require_relative 'lib/game'
require_relative 'lib/result_printer'
require_relative 'lib/word_reader'

VERSION = 'Игра виселица, версия 5. (c) Хороший программист'

reader = WordReader.new
current_path = File.dirname(__FILE__)
slovo = reader.read_from_file(current_path + "/data/words.txt")

game = Game.new(slovo)
game.version = VERSION

printer = ResultPrinter.new(game)

while game.in_progress?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
