class Board
	attr_accessor :spaces
	attr_reader :winning_combinations, :human_marker, :computer_marker

	def initialize
		@spaces = [1,2,3,4,5,6,7,8,9]
		@winning_combinations = [
														[1,2,3],
														[4,5,6],
														[7,8,9],
														[1,4,7],
														[2,5,8],
														[3,6,9],
														[1,5,9],
														[3,5,7]
													]
		@human_marker = "X"
		@computer_marker = "O"
	end

	def computer_spaces
		find_taken_spaces(@spaces, @computer_marker)
	end

	def human_spaces
		find_taken_spaces(@spaces, @human_marker)
	end

	def find_taken_spaces(board_spaces, marker)
		spots = board_spaces.map.with_index {|space, index| index + 1 if space == marker}
		spots.delete(nil)
		spots
	end
end