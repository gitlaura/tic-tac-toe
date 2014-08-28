require 'computer_player.rb'

describe "Computer Player" do
	let(:board){Board.new}

	it "makes a board selection" do
		board.spaces = [1,2,"X","X","O","O",7,8,"X"]
		selection = ComputerPlayer.select_board_space(board)
		expect(selection).to eq(2)
	end
end