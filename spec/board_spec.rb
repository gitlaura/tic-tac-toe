require 'board.rb'

describe "Board" do
	let(:board){Board.new(GameRules.new)}
	let(:board_size){3}

	it "finds all of the taken spaces a computer player" do 
		board.spaces = [1,2,3,"X","O",6,"X",8,"O"]
		expect(board.computer_spaces).to eq([5,9])
	end

	it "finds all of the taken spaces a human player" do 
		board.spaces = [1,2,3,"X","O",6,"X",8,"O"]
		expect(board.human_spaces).to eq([4,7])
	end

	it "creates board" do 
		board_spaces = board.create_board(board_size)
		expect(board_spaces).to eq([1,2,3,4,5,6,7,8,9])
	end

	it "creates winning spaces" do
		result = board.create_winning_spaces(board_size)
		expect(result[0]).to eq([1,2,3])
		expect(result.size).to eq(8)
	end

	it "creates winning row combinations" do 
		result = board.create_winning_row_combinations(board_size)
		expect(result[0]).to eq([1,2,3])
		expect(result.size).to eq(3)
	end

	it "creates winning column combinations" do
		row_combos = [[1,2,3],[4,5,6],[7,8,9]]
		result = board.create_winning_column_combinations(row_combos)
		expect(result[0]).to eq([1,4,7])
		expect(result.size).to eq(3)
	end
end