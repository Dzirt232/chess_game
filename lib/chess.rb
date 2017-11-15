class Chess
attr_accessor :type, :color

end

class King < Chess#король

  def initialize(color)
    @type = "\u265A"
    @color = color
  end
end

class Pawn < Chess#пешка

  def initialize(color)
    @type = "\u265F"
    @color = color
  end
end

class Knight < Chess#конь
  def initialize(color)
    @type = "\u265E"
    @color = color
  end
end

class Queen < Chess#королева
  def initialize(color)
    @type = "\u265B"
    @color = color
  end
end

class Bishop < Chess#слон
  def initialize(color)
    @type = "\u265D"
    @color = color
  end
end

class Rook < Chess#ладья
  def initialize(color)
    @type = "\u265C"
    @color = color
  end
end
