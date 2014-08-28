require_relative 'command_line_io.rb'

class HumanPlayer
	class << self
		include CommandLineIO

		def select_board_space(board)
			give "Player 1, please select an open space (1-9) on the board ."
			selection = receive.to_i
			return selection if valid_board_space?(selection, board.spaces)
			give "Not a valid board space! Please try again."
			select_board_space(board)
		end

		def valid_board_space?(user_selection, board_spaces)
			board_spaces.include?(user_selection)
		end
	end
end