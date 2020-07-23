require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board_game'
require_relative 'lib/case'


my_game = Game.new()
my_game.init_game_player
continue = "oui"
while !(continue == "non")
  my_game.init_board
  my_game.partie
  puts "nouvelle partie ? (oui / non)"
  print "=>"
  continue = gets.chomp
  while not (continue == "oui" || continue == "non")
    puts "c'est oui ou c'est non !"
    print "=>"
    continue = gets.chomp
  end
end