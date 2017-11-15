require './lib/game.rb'

class Player
  attr_accessor :name, :color, :status

  def initialize(name,color)
    @name = name
    @color = color
  end

  def turn_right?(turn)

  end

  def make_turn(turn)

  end

  def turn
    puts "Enter your position:"
    while true
      turn = gets.chomp.strip
      save_game if turn == "save"
      if turn_right?(turn)
        make_turn(turn)
        break
      else
        puts "Try again"
      end
    end
  end
end
