require './lib/game.rb'

class Field
attr_accessor :ceils

  class Ceil
    attr_accessor :position, :row, :colon, :figure

    def initialize(number,letter)
      @row = number
      @colon = letter
      @position = "#{letter}#{number}"
      @figure = nil
      color = @row > 4 ? :black : :white
      if @row == 2 || @row == 7
        @figure = Pawn.new(color)
      end
      if @row == 1 || @row == 8

        if @colon == "a" || @colon == "h"
          @figure = Rook.new(color)
        end

        if @colon == "b" || @colon == "g"
          @figure = Knight.new(color)
        end

        if @colon == "c" || @colon == "f"
          @figure = Bishop.new(color)
        end

        if @colon == "d"
          @figure = Queen.new(color)
        end

        if @colon == "e"
          @figure = King.new(color)
        end
      end
    end
  end

  def initialize
    @ceils = []
    for i in 1..8 do
      for j in 'a'..'h'
        @ceils << Ceil.new(i,j)
      end
    end
  end

  def show(color = :white)
    puts
    strings = ["\n   "]
    ('a'..'h').each { |e| strings[0] += "  #{e} "}
    if color == :white
      k = 0
      i = 1
      while true
        strings[i] = "\n#{i}  "
        for j in 1..8 do
          strings[i] += @ceils[k].figure != nil ? "  #{@ceils[k].figure.type} " : "  \u2610 "
          k += 1
        end
        i += 1
        break if i > 8
      end
    elsif color == :black
      k = 63
      i = 8
      while true
        strings [9-i] = "\n#{i}  "
        for j in 1..8 do
          strings[9-i] += @ceils[k].figure != nil ? "  #{@ceils[k].figure.type} " : "  \u2610 "
          k -= 1
        end
        i -= 1
        break if i == 0
      end
    end
    puts strings.reverse
    print "\n\n"
  end

end
