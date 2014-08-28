class Runner
	def initialize
		@game = Game.new
		board = Board.new
		play_game(board)
	end

	def play_game(board)
		@game.welcome
		until @game.game_over?(board) do
			@game.show_board(board)
			player = @game.update_player(player)
			selection = @game.get_selection(player, board)
			board = @game.update_board(board)
		end
		@game.end_game
	end
end