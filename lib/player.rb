require './lib/game.rb'

class Player
  attr_accessor :name, :color, :status

  def initialize(name,color)
    @name = name
    @color = color
  end

  def turn_right?(start_ceil,turn,figure)
    if turn.figure != nil
      return false if turn.figure.color == @color
    end
    if figure.right_turn?(start_ceil,turn)
      return true
    end
    false
  end

  def make_turn(start_ceil,aim_ceil,figure)
    start_ceil.figure = nil
    aim_ceil.figure = figure
  end

  def turn(field)
    while true
      puts "Turn of Player #{name}"
      puts "Enter your figure:"
      $field = field
      figure = gets.chomp.strip
      save_game if figure == "save"
      if figure.match(/^[a-h][1-8]$/)
        start_ceil = field.ceils.select { |ceil| ceil.position == figure }[0]
        if start_ceil.figure != nil && @color == start_ceil.figure.color
          puts "Enter yor position:"
          turn = gets.chomp.strip
          save_game if turn == "save"
          if turn.match(/^[a-h][1-8]$/)
            aim_ceil = field.ceils.select { |ceil| ceil.position == turn }[0]
            if turn_right?(start_ceil,aim_ceil,start_ceil.figure)
              make_turn(start_ceil,aim_ceil,start_ceil.figure)
              break
            else
              puts "Wrong turn, try again."
            end
          else
            puts "Wrong position, try again."
          end
        else
          puts "Here is have not your figure, try again"
        end
      else
        puts "This is a wrong input, try again"
      end
    end
  end
end
