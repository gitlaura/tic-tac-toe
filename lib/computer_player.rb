require_relative 'computer_space_selector.rb'

class ComputerPlayer
	class << self
		def select_board_space(board)
			ComputerSpaceSelector.make_selection(board)
		end
	end
end