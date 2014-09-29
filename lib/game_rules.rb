class GameRules
	attr_reader :board_size, :players, :human_marker, :computer_marker

	def initialize
		@board_size = 3
		@players = [HumanPlayer, ComputerPlayer]
		@human_marker = "X"
		@computer_marker = "O"
	end
end