require 'pry-byebug'
module Escapable
    def checkmate?(color)
        check?(color) && !go_away?(color) && !capture_checking_piece?(color) && !interpose_piece?(color)
    end

    def go_away?(color)
        king  = pieces.find { |e| e.color == color && e.class == King}

        king_moves = king.valid_moves(king.location,self)
        forbidden_moves = []
        king_moves.each do |k_m|
            pieces.select { |p| p.color != color }.each do |piece|
                if piece.valid_moves(piece.location,self).include?(k_m)
                    forbidden_moves << k_m
                    break
                end
            end
        end
        
        if forbidden_moves == king_moves
            return false
        else
            return true
        end
    end

    def capture_checking_piece?(color)
        pieces.select { |p| p.color == color}.each do |piece|
            if piece.valid_moves(piece.location,self).include?(find_checking_piece(color)[0].location)
                return true 
            end
        end
        return false 
    end



    def find_checking_piece(color)
        king  = pieces.find { |e| e.color == color && e.class == King}

        checking_piece = []

        pieces.select { |p| p.color != color }.each do |piece|
            if piece.valid_moves(piece.location,self).include?(king.location)
                checking_piece << piece 
            end
        end

        checking_piece
    end

    def king_dir(color)
        king_loc  = pieces.find { |e| e.color == color && e.class == King}.location
        checking_piece = find_checking_piece(color)[0]

        checking_piece.move_dirs.each do |(dr,dc)|
            c_r,c_c = find_checking_piece(color)[0].location
            loop do
                c_r += dr
                c_c += dc
                if c_r == king_loc[0] && c_c == king_loc[1]
                    return [dr,dc]
                    
                elsif 
                   !self.in_bounds?([c_r,c_c])
                   break
                end
            end
        end
    end

    def moves_to_the_king(color)
        king_loc  = pieces.find { |e| e.color == color && e.class == King}.location
        current_r, current_c = find_checking_piece(color)[0].location
        dr,dc = king_dir(color)
        moves = []
        
        loop do 
            current_r += dr 
            current_c += dc 
            break if current_r == king_loc[0] && current_c == king_loc[1]
            moves << [current_r,current_c]
        end

        moves 
    end

    def interpose_piece?(color)
        pieces.select { |p| p.color == color && p.class != King }.each do |piece|
            if piece.valid_moves(piece.location,self).intersect?(moves_to_the_king(color))
                return true
            end
        end
        return false
    end

end