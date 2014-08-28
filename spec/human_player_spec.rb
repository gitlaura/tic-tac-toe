require 'human_player.rb'

describe "Human player" do 
	let(:human_player){HumanPlayer.new}
	let(:board){[1,2,3,4,"X","O",7,8,9]}

	it "selects a space" do
		expect(human_player).to receive(:give)
		expect(human_player).to receive(:receive){1}

		selection = human_player.select_board_space(board)

		expect(selection).to eq(1)
	end

	it "returns true for a valid selection" do 
		selection = 3
		result = human_player.valid_board_space?(selection, board)
		expect(result).to be(true)
	end

	it "returns false for an invalid selection" do 
		selection = 5
		result = human_player.valid_board_space?(selection, board)
		expect(result).to be(false)
	end
end