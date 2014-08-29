require 'computer_space_selector'

describe "Computer space selector" do
	let(:board){Board.new(GameRules.new)}
	let(:winning_combinations){board.winning_combinations}

	context "makes an intelligent move" do 
		it "if computer is about to win" do
			board.spaces = ["X", "O", "X","X","O",6,7,8,9]
			selection = ComputerSpaceSelector.make_selection(board)
			expect(selection).to eq(8)
		end

		it "if human is about to win" do
			board.spaces = [1,2,3,4,"O",6,"X",8,"X"]
			selection = ComputerSpaceSelector.make_selection(board)
			expect(selection).to eq(8)
		end

		it "if nobody can win yet" do
			board.spaces = [1,"X",3,4,"O",6,"X","O","X"]
			selection = ComputerSpaceSelector.make_selection(board)
			expect(selection).to eq(4)
		end
	end

	context "returns a new winning spot if possible" do
		it "should return spot" do
			computer_spaces = [2,5]
			human_spaces = [1,4,6]
			result = ComputerSpaceSelector.find_winning_spot(computer_spaces, human_spaces, winning_combinations)
			expect(result).to eq(8)
		end

		it "should not return a spot" do 
			human_spaces = [1,8]
			computer_spaces = [3]
			result = ComputerSpaceSelector.find_winning_spot(human_spaces, computer_spaces, winning_combinations)
			expect(result).to eq(nil)
		end
	end

	context "selects spot" do
		it "with a middle spot" do
			computer_spaces, human_spaces = [6], [3,8]
			selection = ComputerSpaceSelector.select_spot(computer_spaces, human_spaces, winning_combinations)
			expect(selection).to eq(5)
		end

		it "with the first spot available" do
			computer_spaces, human_spaces = [], [5]
			selection = ComputerSpaceSelector.select_spot(computer_spaces, human_spaces, winning_combinations)
			expect(selection).to eq(1)
		end

		it "with the first spot available" do
			computer_spaces, human_spaces = [], [5]
			selection = ComputerSpaceSelector.select_spot(computer_spaces, human_spaces, winning_combinations)
			expect(selection).to eq(1)
		end
	end

	it "checks if the middle spot is open" do 
		middle_spot = 5
		computer_spaces, human_spaces = [4], [1,3]
		result = ComputerSpaceSelector.middle_spot_open?(computer_spaces, human_spaces)
		expect(result).to eq(true)
	end

	it "selects an open space in the computers favor" do
		computer_spaces, human_spaces = [5], [1,3]
		selection = ComputerSpaceSelector.select_open_space_in_computers_favor(computer_spaces, human_spaces, winning_combinations)
		expect(selection).to eq(4)
	end
end