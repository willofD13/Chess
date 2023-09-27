module Slideable
    def valid_moves(location,board)
        moves = []
        
        move_dirs.each do |(dr,dc)|
            current_r, current_c = location
            loop do 
                #binding.pry
                current_r += dr
                current_c += dc
                break if !board.in_bounds?([current_r,current_c]) || is_it_a_friend?([current_r,current_c])
                if board.empty?([current_r,current_c])
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