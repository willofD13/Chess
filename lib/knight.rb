require_relative 'stepable.rb'
class Knight < Piece
    include Stepable
    def move_dirs
        [[+2,+1], [+2,-1], [+1,+2], [+1,-2], [-1,+2], [-1,-2], [-2,+1], [-2,-1]]
    end

    def to_s 
        @color == 'black' ? '♘' : '♞'
    end
end