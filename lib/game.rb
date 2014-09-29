require_relative 'command_line_messages.rb'
require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'
require_relative 'game_rules.rb'

class Game
	attr_accessor :board

	def initialize
		@board = Board.new(GameRules.new)
	end

	def welcome
		CommandLineMessages.display_welcome
	end

	def game_over?
		return true if person_won?(@board.human_spaces) || person_won?(@board.computer_spaces) || tie_game?
		false
	end

	def update_player(player = nil)
		return ComputerPlayer if player == HumanPlayer
		HumanPlayer
	end

	def get_selection(player)
		player.select_board_space(@board)
	end

	def update_board(player, selection)
		if player == HumanPlayer
			@board.spaces[selection - 1] = @board.human_marker
		else
			@board.spaces[selection - 1] = @board.computer_marker
		end
	end

	def end_game
		return CommandLineMessages.display_human_win(@board.spaces) if person_won?(@board.human_spaces)
		return CommandLineMessages.display_computer_win(@board.spaces) if person_won?(@board.computer_spaces)
		CommandLineMessages.display_tie(@board.spaces)
	end

	def person_won?(spaces)
		matches = 0
		@board.winning_combinations.each do |winning_combination|
			spaces.each do |taken_space|
				if winning_combination.include?(taken_space)
					matches += 1
					return true if matches == spots_needed_to_win
				end
			end
			matches = 0
		end
		false
	end

	def tie_game?
		return true if (board.human_spaces + board.computer_spaces).length == @board.spaces.length
		false
	end

	def spots_needed_to_win
		Math.sqrt(@board.spaces.length.to_i)
	end
end