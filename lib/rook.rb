require 'pry-byebug'
class Rook < Piece

    def move_dirs
        [[1,0],[0,1],[-1,0],[0,-1]]
    end

    def to_s 
        @color == 'black' ? '♖' : '♜'
    end

    def valid_moves(location,board)
        moves = []
        
        move_dirs.each do |(dr,dc)|
            current_r, current_c = location
            loop do 
                #binding.pry
                current_r += dr
                current_c += dc
                break if !board.in_bounds?([current_r,current_c]) || is_it_a_friend?([current_r,current_c])
                if board[[current_r,current_c]].nil?
                    moves << [current_r,current_c]
                end
                if is_there_an_enemy?([current_r,current_c])
                    moves << [current_r,current_c]
                end
            end
        end
        moves
    end
end