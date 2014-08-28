require_relative 'computer_space_selector.rb'

class ComputerPlayer
	def initialize(board)
		@winning_combinations = create_winning_combinations(board) 
	end

	def create_winning_combinations(board)
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
	end

	def select_board_space(board)
		computer_spaces = find_taken_spaces(board,computer_marker)
		human_spaces = find_taken_spaces(board,human_marker)
		ComputerSpaceSelector.make_selection(computer_spaces, human_spaces, @winning_combinations)
	end

	def find_taken_spaces(board, marker)
		computer_spaces = []
		board.each_with_index do |space,index|
			if space == marker
				computer_spaces << index+1
			end
		end
		computer_spaces
	end

	private

	def computer_marker
		"O"
	end

	def human_marker
		"X"
	end

end