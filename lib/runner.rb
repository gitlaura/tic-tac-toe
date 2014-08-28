class Runner
	attr_reader :game 

	def initialize
		@game = Game.new
	end

	def play_game
		@game.welcome
		until @game.game_over? do
			@game.display_board
			player = @game.update_player(player)
			selection = @game.get_selection(player)
			@game.update_board(player, selection)
		end
		@game.end_game
	end
end