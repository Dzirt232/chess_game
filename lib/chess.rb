class Chess
attr_accessor :type


  class King #король

    def initialize
      @type = "\u265A"
    end
  end

  class Pawn #пешка

    def initialize
      @type = "\u265F"
    end
  end

  class Knight #конь
    def initialize
      @type = "\u265E"
    end
  end

  class Queen #королева
    def initialize
      @type = "\u265B"
    end
  end

  class Bishop #слон
    def initialize
      @type = "\u265D"
    end
  end

  class Rook #ладья
    def initialize
      @type = "\u265C"
    end
  end

end
