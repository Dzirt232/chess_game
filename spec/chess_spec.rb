#this is a spec for many classes of class Chess
require "./lib/chess.rb"
require "./lib/field.rb"
require "./lib/player.rb"

describe Chess do
$colon_array = []
for j in 'a'..'h'
  $colon_array << j
end

before(:all){$figure = Chess::Pawn.new(:white)}
before(:all){$player = Player.new("Dzirt",:white)}
before(:all){
  $field = Field.new
  $field.ceils.each { |e| e.figure = nil }}

  describe Pawn do

    before(:each){
      $aim_ceil.figure = nil
    }

    $start_ceil = Field::Ceil.new(3,'a')
    $aim_ceil = Field::Ceil.new(4,'a')

    context "turn straight" do

      it "on free ceil" do
        expect($figure.right_turn?($start_ceil,$aim_ceil)).to be true
      end

      it "not on busy ceil" do
        $aim_ceil.figure = Bishop.new(:black)
        expect($figure.right_turn?($start_ceil,$aim_ceil)).to be false
      end
    end


    context "turn at an angle" do

      it "on busy ceil and kill enemy figure" do
        $aim_ceil.colon = 'b'
        $aim_ceil.figure = Bishop.new(:black)
        $start_ceil.figure = Pawn.new(:white)
        expect($figure.right_turn?($start_ceil,$aim_ceil)).to be true
        $player.make_turn($start_ceil,$aim_ceil,$start_ceil.figure)
        expect($aim_ceil.figure.color).to eql(:white)
      end

      it "not on free ceil" do
        $aim_ceil.colon = 'b'
        expect($figure.right_turn?($start_ceil,$aim_ceil)).to be false
      end
    end
  end

  describe King do

      before(:all){$figure = Chess::King.new(:white)}
      before(:each){
        $aim_ceil.figure = nil
      }

      $start_ceil = Field::Ceil.new(3,'a')
      $aim_ceil = Field::Ceil.new(4,'a')

      context "turn vertical" do
        it "on free ceil" do
          expect($figure.right_turn?($start_ceil,$aim_ceil)).to be true
        end

        it "on busy ceil and kill enemy figure" do
          $aim_ceil.figure = Bishop.new(:black)
          $start_ceil.figure = Pawn.new(:white)
          expect($figure.right_turn?($start_ceil,$aim_ceil)).to be true
          $player.make_turn($start_ceil,$aim_ceil,$start_ceil.figure)
          expect($aim_ceil.figure.color).to eql(:white)
        end
      end

      context "turn angle" do
          it "on free ceil" do
            $aim_ceil.colon = 'b'
            expect($figure.right_turn?($start_ceil,$aim_ceil)).to be true
          end
      end
  end

  describe Queen do
    before(:all){$figure = Chess::Queen.new(:white)}
    before(:each){
      $aim_ceil.figure = nil
    }


    context "turn horizontal" do
      it "on free way" do
        $start_ceil = Field::Ceil.new(1,'a')
        $aim_ceil = Field::Ceil.new(1,'h')
        expect($figure.right_turn?($start_ceil,$aim_ceil)).to be true
      end

      it "not on busy way" do
        $field.ceils[3].figure = Bishop.new(:black)
        expect($figure.right_turn?($start_ceil,$aim_ceil)).to be false
        $field.ceils[3].figure = nil
      end
    end

    context "turn angle" do
      it "on free way" do
        $start_ceil = Field::Ceil.new(1,'a')
        $aim_ceil = Field::Ceil.new(3,'c')
        expect($figure.right_turn?($start_ceil,$aim_ceil)).to be true
      end

      it "not on busy way" do
        $field.ceils[9].figure = Bishop.new(:black)
        expect($figure.right_turn?($start_ceil,$aim_ceil)).to be false
        $field.ceils[9].figure = nil
      end
    end
  end

end
