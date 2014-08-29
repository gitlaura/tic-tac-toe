require 'board.rb'

describe "Board" do
	let(:board){Board.new}

	it "creates an array with 9 empty spots" do
		expect(board.spaces.size).to be(9)
		expect(board.winning_combinations.size).to be(8)
	end

	it "finds all of the taken spaces a computer player" do 
		board.spaces = [1,2,3,"X","O",6,"X",8,"O"]
		expect(board.computer_spaces).to eq([5,9])
	end

	it "finds all of the taken spaces a human player" do 
		board.spaces = [1,2,3,"X","O",6,"X",8,"O"]
		expect(board.human_spaces).to eq([4,7])
	end
end