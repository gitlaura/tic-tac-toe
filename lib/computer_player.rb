require_relative 'computer_space_selector.rb'

class ComputerPlayer
	class << self
		def select_board_space(board)
			ComputerSpaceSelector.make_selection(board.computer_spaces, board.human_spaces, board.winning_combinations)
		end
	end
end