require_relative "../lib/chess"
describe Chess do 

    describe "#verify_choice" do 

        subject(:game) { described_class.new }

        it "makes choice evaluation in correct order" do
            turn = game.instance_variable_get(:@turn)
            turn = 1
            expect(game).to receive(:verify_choice).and_return(['white','pawn'])
            game.verify_choice('white_pawn')
        end 
    end
end


