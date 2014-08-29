require_relative 'command_line_messages.rb'

class HumanPlayer
	class << self
		def select_board_space(board)
			CommandLineMessages.display_board(board.spaces)
			selection = CommandLineMessages.request_selection
			return selection if valid_board_space?(selection, board.spaces)
			CommandLineMessages.display_invalid_selection
			select_board_space(board)
		end

		def valid_board_space?(user_selection, board_spaces)
			board_spaces.include?(user_selection)
		end
	end
end