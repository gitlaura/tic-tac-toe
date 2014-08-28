require_relative 'command_line_messages.rb'
require_relative 'board.rb'

class Game
	attr_accessor :board

	def initialize
		@board = Board.new
	end

	def welcome
		CommandLineMessages.display_welcome
	end

	def game_over?
		return true if person_won?(@board.human_spaces) || person_won?(@board.computer_spaces) || tie_game?
		false
	end

	def display_board
		CommandLineMessages.display_board(@board.spaces)
	end

	def update_player(player = nil)
		if player == HumanPlayer
			return ComputerPlayer 
		else
			HumanPlayer
		end
	end

	def get_selection(player)
		player.select_board_space(@board)
	end

	def update_board(player, selection)
		if player == HumanPlayer
			@board.spaces[selection - 1] = "X"
		else
			@board.spaces[selection - 1] = "O"
		end
	end

	def end_game
		return CommandLineMessages.display_human_win if person_won?(@board.human_spaces)
		return CommandLineMessages.display_computer_win if person_won?(@board.computer_spaces)
		CommandLineMessages.display_tie
	end

	def person_won?(spaces)
		matches = 0
		@board.winning_combinations.each do |winning_combination|
			spaces.each do |taken_space|
				if winning_combination.include?(taken_space)
					matches += 1
					return true if matches == 3
				end
			end
			matches = 0
		end
		false
	end

	def tie_game?
		return true if (board.human_spaces.length + board.computer_spaces.length) == 9
		false
	end
end