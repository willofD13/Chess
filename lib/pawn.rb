require_relative 'piece.rb'
class Pawn < Piece
   
    def move_dirs
        @color == 'black' ? [[1,0],[2,0],[1,-1],[1,1]] : [[-1,0],[-2,0],[-1,1],[-1,-1]]
    end

    def to_s 
        @color == 'black' ? '♙' : '♟︎'
    end

    def valid_moves(location,board)
        moves = []
        
        move_dirs.each do |dir|
            current_r, current_c = location
            new_r = current_r + dir[0] 
            new_c = current_c + dir[1]
            if dir == move_dirs[2] || dir == move_dirs[3]
                moves << [new_r,new_c] if is_there_an_enemy?([new_r,new_c])
            elsif 
                dir == move_dirs[1]
                moves << [new_r,new_c] if (current_r == 1 || current_r == 6) && board.empty?([new_r,new_c])  
            elsif 
                dir == move_dirs[0]
                moves << [new_r,new_c] if board.in_bounds?([new_r,new_c]) && board.empty?([new_r,new_c])
            end

        end
        moves
    end  
end

