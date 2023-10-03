class King < Piece
    include Stepable
    def move_dirs
        [[1,1],[1,-1],[-1,1],[-1,-1],[1,0],[-1,0],[0,-1],[0,1]]
    end

    def to_s 
        @color == 'black' ? '♕' : '♛'
    end

end