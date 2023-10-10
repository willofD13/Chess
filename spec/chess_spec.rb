require_relative "../lib/chess"
describe Chess do 

    describe "#starting_location" do 

        subject(:chess) { described_class.new(Board.new,player_1 = 'leon',player_2 = 'penny') }
        context 'sggdhfh' do
            before do
                answer = '6,0'
                allow(chess).to receive(:gets).and_return(answer)
            end

            it "exits loop when right chess piece is chosen" do 
                color = chess.color
                error_message = "Wrong input!. Be sure you picked a #{color} chess piece and the coordinates input have the right value and format."

                expect(chess).not_to receive(:puts).with(error_message)
                chess.starting_location(color)
            end
        end
    end

    describe "#target_location" do 

        subject(:game) { described_class.new(Board.new) }

        before do
            target = '5,0'
            allow(game).to receive(:gets).and_return(target)
        end

        xit "returns an array from a given string" do 
            color = chess.color
            array = game.target_location(color)
            
            expect(target_location).to eq([5,0])
        end
    end

    describe "#save_game" do 

        subject(:save_method) { described_class.new(Board.new,player_1 = 'leon',player_2 = 'john')}
        context "when the directory exists" do
            before do 
                answer = '1'
                allow(save_method).to receive(:gets).and_return(answer)
                allow(Dir).to receive(:exist).and_return(true)
            end

            it "does not create new directory" do 
                expect(Dir).not_to receive(mkdir)
                save_method.save_game
            end

            it "sends message to create a file" do
                expect(File).to receive(:open)
                save_method.save_game
            end
        end

        context "when the directory does not exist" do
            before do 
                answer = '1'
                allow(save_method).to receive(:gets).and_return(answer)
                allow(Dir).to receive(:exist).and_return(false)
            end

            it "creates new directory" do 
                expect(Dir).to receive(:mkdir)
                save_method.save_game
            end

            it "sends message to create a file" do
                expect(File).to receive(:open)
                save_method.save_game
            end

        end
    end

end


