class Chess
attr_accessor :type, :color

end

class King < Chess#король

  def initialize(color)
    @color = color
    @type = color == :white ? "\u265A" : "\u2654"
  end
end

class Pawn < Chess#пешка

  def right_xod?(start_ceil,aim_ceil)
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
    # print start_ceil.position
    # print aim_ceil.position
    # print $colon_array
    # puts colon_start
    # puts colon_aim
    # puts $colon_array.index(colon_start)
    # puts $colon_array.index(colon_aim)
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
