require 'human_player.rb'

describe "Human player" do 
	let(:board){Board.new}

	it "selects a space" do
		expect(CommandLineMessages).to receive(:display_board)
		expect(CommandLineMessages).to receive(:request_selection){1}
		selection = HumanPlayer.select_board_space(board)
		expect(selection).to eq(1)
	end

	it "returns true for a valid selection" do 
		selection = 3
		result = HumanPlayer.valid_board_space?(selection, board.spaces)
		expect(result).to be(true)
	end

	it "returns false for an invalid selection" do 
		board.spaces = [1,2,3,"X","O","X",7,8,9]
		selection = 5
		result = HumanPlayer.valid_board_space?(selection, board.spaces)
		expect(result).to be(false)
	end
end