require './lib/player.rb'
require './lib/field.rb'
require './lib/computer.rb'
require './lib/chess.rb'

def game_over?

end

def game_continue(player_1,player_2)
  $field = Field.new
  while !game_over?
    $field.show(player_1.color)
    player_1.turn
    break if game_over?
    $field.show(player_2.color)
    player_2.turn
  end
end

def player_vs_player
  puts "Enter a name for the first player(white): "
  player_1 = Player.new(gets.chomp.strip,:white)
  puts "Enter a name for the second player(black): "
  player_2 = Player.new(gets.chomp.strip,:black)
  game_continue(player_1,player_2)
end

def player_vs_comp

end

def greet(type)
  case type
  when 1
    player_vs_player
  when 2
    player_vs_comp
  end
end
