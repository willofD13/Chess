module Stepable
    def valid_moves(location,board)
        moves = []
        
        move_dirs.each do |(dr,dc)|
            current_r, current_c = location
            current_r += dr 
            current_c += dc
            moves << [current_r,current_c] if board.empty?([current_r,current_c]) || is_there_an_enemy?([current_r,current_c])
        end
        moves
    end  
end