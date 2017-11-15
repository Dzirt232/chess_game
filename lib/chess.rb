class Chess
attr_accessor :type, :color

end

class King < Chess#король

  def initialize(color)
    @color = color
    @type = color == :white ? "\u2654" : "\u265A"
  end
end

class Pawn < Chess#пешка

  def initialize(color)
    @color = color
    @type = color == :white ? "\u2659" : "\u265F"
  end
end

class Knight < Chess#конь
  def initialize(color)
    @color = color
    @type = color == :white ? "\u2658" : "\u265E"
  end
end

class Queen < Chess#королева
  def initialize(color)
    @color = color
    @type = color == :white ? "\u2655" : "\u265B"
  end
end

class Bishop < Chess#слон
  def initialize(color)
    @color = color
    @type = color == :white ? "\u2657" : "\u265D"
  end
end

class Rook < Chess#ладья
  def initialize(color)
    @color = color
    @type = color == :white ? "\u2656" : "\u265C"
  end
end
