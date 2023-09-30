require 'pry-byebug'
module Escapable
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

end