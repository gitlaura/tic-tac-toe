require 'computer_player.rb'

describe "Computer Player" do
	let(:fresh_board){[1,2,3,4,5,6,7,8,9]}
	let(:computer_player){ComputerPlayer.new(fresh_board)}

	it "creates winning combinations" do
		result = computer_player.create_winning_combinations(fresh_board)
		expect(result.size).to eq(8)
		expect(result.first).to eq([1,2,3])
	end

	it "makes a board selection" do
		board = [1,2,"X","X","O","O",7,8,"X"]
		selection = computer_player.select_board_space(board)
		expect(selection).to eq(2)
	end

	it "finds all of the taken spaces a computer player" do 
		board = [1,2,3,"X","O",6,"X",8,"O"]
		computer_spaces = computer_player.find_taken_spaces(board, "O")
		expect(computer_spaces).to eq([5,9])
	end

	it "finds all of the taken spaces a human player" do 
		board = [1,2,3,"X","O",6,"X",8,"O"]
		computer_spaces = computer_player.find_taken_spaces(board, "X")
		expect(computer_spaces).to eq([4,7])
	end
end