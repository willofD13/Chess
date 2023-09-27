class Piece 
    attr_reader :color
    def initialize(color,board,location)
        @board = board
        @color = color
        @location = location
    end

    def is_there_an_enemy?(location)
        !@board[location].nil? && @board[location].color != color
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