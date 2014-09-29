require_relative 'command_line_io.rb'

class CommandLineMessages
	class << self
		include CommandLineIO

		def display_welcome
			give "****************************************************"
			give "Welcome to Tic Tac Toe! You will be player 1 and your mark will be 'X'. Try to beat the computer 'O'."
		end

		def display_board(board_spaces)
			give ""
			give " #{board_spaces[0]} | #{board_spaces[1]} | #{board_spaces[2]}"
			give "-----------"
			give " #{board_spaces[3]} | #{board_spaces[4]} | #{board_spaces[5]}"
			give "-----------"
			give " #{board_spaces[6]} | #{board_spaces[7]} | #{board_spaces[8]}"
		end

		def request_selection
			give ""
			give "Player 1: Please select an open space (1-9) on the board:"
			receive.to_i
		end

		def display_invalid_selection
			give ""
			give "**Not a valid board space! Please try again.**"
		end

		def display_human_win(board_spaces)
			give ""
			give "Final Board:"
			display_board(board_spaces)
			give "**Game over. Good job, you won!**"
		end

		def display_computer_win(board_spaces)
			give ""
			give "Final Board:"
			display_board(board_spaces)
			give "**Game over. Sorry, the computer won this time!**"
		end

		def display_tie(board_spaces)
			give ""
			give "Final Board:"
			display_board(board_spaces)
			give "**Game over. You tied!**"
		end
	end
end