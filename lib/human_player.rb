require_relative 'command_line_io.rb'

class HumanPlayer
	include CommandLineIO

	def select_board_space(board)
		give "Player 1, please select an open space on the board."
		selection = receive.to_i
		return selection if valid_board_space?(selection, board)
		give "Not a valid board space! Please try again."
		select_board_space(board)
	end

	def valid_board_space?(user_selection, board)
		board.include?(user_selection)
	end
end