class Rook < Piece

    def move_dirs
        [[1,0],[0,1],[-1,0],[0,-1]]
    end

    def to_s 
        @color == 'black' ? '♖' : '♜'
    end

    def possible_moves
        array = []
        8.times do
            move_dirs.each do |d|
                d[0] += 1
                d[1] += 1
                array << [d[0],d[1]]
            end
        end
        array
    end
end