require './lib/game.rb'

class Chess
attr_accessor :type, :color

  def way_vertical_free?(start_ceil,aim_ceil)
      for i in start_ceil.row+1..aim_ceil.row-1
        ceil = $field.ceils.select { |ceil| ceil.row == i }[0]
        return false if ceil.figure != nil
      end
      true
  end

  def way_horizontal_free?(start_ceil,aim_ceil)
      for i in $colon_array.index(start_ceil.colon)+1..$colon_array.index(aim_ceil.colon)-1
        ceil = $field.ceils.select { |ceil| $colon_array.index(ceil.colon) == i }[0]
        return false if ceil.figure != nil
      end
      true
  end

  def way_angle_free?(start_ceil,aim_ceil)
    ceil = start_ceil
    direction_vertical = aim_ceil.row > start_ceil.row ? 1 : -1
    direction_horizontal = $colon_array.index(aim_ceil.colon) > $colon_array.index(start_ceil.colon) ? 1 : -1
    while ceil.row != aim_ceil.row - direction_vertical
      ceil = $field.ceils.select { |c| ceil.row + direction_vertical == c.row &&
        $colon_array.index(ceil.colon) + direction_horizontal == $colon_array.index(c.colon)}[0]
        return false if ceil.figure != nil
    end
    true
  end
end

class King < Chess#король

  def initialize(color)
    @color = color
    @type = color == :white ? "\u265A" : "\u2654"
  end

  def right_turn?(start_ceil,aim_ceil)
    row_start = start_ceil.row
    colon_start = start_ceil.colon
    row_aim = aim_ceil.row
    colon_aim = aim_ceil.colon
    if (row_aim == row_start + 1 || row_aim == row_start - 1) &&
      ($colon_array.index(colon_start) == $colon_array.index(colon_aim)+1 || $colon_array.index(colon_start) == $colon_array.index(colon_aim)-1 || $colon_array.index(colon_start) == $colon_array.index(colon_aim))
      if aim_ceil.figure != nil
         return true if aim_ceil.enemy_ceil?(@color)
      end
      return true if aim_ceil.figure == nil
    end
    false
  end
end

class Pawn < Chess#пешка

  def right_turn?(start_ceil,aim_ceil)
    row_start = start_ceil.row
    colon_start = start_ceil.colon
    row_aim = aim_ceil.row
    colon_aim = aim_ceil.colon
    direction = @color == :white ? 1 : -1
    if row_aim == row_start + direction && aim_ceil.figure != nil &&
    ($colon_array.index(colon_start) == $colon_array.index(colon_aim)+1 || $colon_array.index(colon_start) == $colon_array.index(colon_aim)-1)
      return true if aim_ceil.enemy_ceil?(@color)
    elsif row_aim == row_start + direction && !($colon_array.index(colon_start) == $colon_array.index(colon_aim)+1 || $colon_array.index(colon_start) == $colon_array.index(colon_aim)-1)
      if aim_ceil.figure == nil
        return true
      end
    end
    false
  end

  def initialize(color)
    @color = color
    @type = color == :white ? "\u265F" : "\u2659"
  end
end

class Knight < Chess#конь
  def initialize(color)
    @color = color
    @type = color == :white ? "\u265E" : "\u2658"
  end
end

class Queen < Chess#королева
  def initialize(color)
    @color = color
    @type = color == :white ? "\u265B" : "\u2655"
  end

  def right_turn?(start_ceil,aim_ceil)
    return false if start_ceil == aim_ceil
    row_start = start_ceil.row
    colon_start = start_ceil.colon
    row_aim = aim_ceil.row
    colon_aim = aim_ceil.colon
    if colon_start == colon_aim
      return true if way_vertical_free?(start_ceil,aim_ceil)
    elsif row_start == row_aim
      return true if way_horizontal_free?(start_ceil,aim_ceil)
    elsif row_aim == $colon_array.index(colon_aim)+1 && row_aim-row_start == $colon_array.index(colon_aim)-$colon_array.index(colon_start)
      return true if way_angle_free?(start_ceil,aim_ceil)
    else
      return false
    end
    false
  end
  # def right_turn?(start_ceil,aim_ceil)
  #   row_start = start_ceil.row
  #   colon_start = start_ceil.colon
  #   row_aim = aim_ceil.row
  #   colon_aim = aim_ceil.colon
  #   if colon_start
  #
  #   end
  # end
end

class Bishop < Chess#слон
  def initialize(color)
    @color = color
    @type = color == :white ? "\u265D" : "\u2657"
  end
end

class Rook < Chess#ладья
  def initialize(color)
    @color = color
    @type = color == :white ? "\u265C" : "\u2656"
  end
end
