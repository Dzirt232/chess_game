require './lib/game.rb'

class Player
  attr_accessor :name, :color, :status

  def initialize(name,color)
    @name = name
    @color = color
  end

  def turn_right?(turn)
    true
  end

  def make_turn(turn)

  end

  def turn
    while true
      puts "Turn of Player #{name}"
      puts "Enter your figure:"
      figure = gets.chomp.strip
      save_game if figure == "save"
      if figure.match(/^[a-h][1-8]$/)
        ceil_figure = $field.ceils.select { |ceil| ceil.position == figure }[0]
        if ceil_figure.figure != nil && @color == ceil_figure.figure.color
          puts "Enter yor position:"
          turn = gets.chomp.strip
          save_game if turn == "save"
          if turn_right?(turn)
            make_turn(turn)
            break
          else
            puts "Try again"
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
