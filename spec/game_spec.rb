require 'game.rb'

describe "Game" do
	before(:each) do
		@game = Game.new
	end

	it "welcomes the players" do
		expect(CommandLineMessages).to receive(:display_welcome)
		@game.welcome
	end

	it "checks to see if the game is over" do
		@game.board.spaces = [1,2,3,"O","O","O",7,"X","X"]
		expect(@game.game_over?).to eq(true)
	end

	context "updates the player" do
		it "if player has not been selected yet" do
			expect(@game.update_player).to eq(HumanPlayer)
		end

		it "if player is Human" do
			expect(@game.update_player(HumanPlayer)).to eq(ComputerPlayer)
		end
	end

	it "gets a selection from a player" do
		expect(HumanPlayer).to receive(:select_board_space)
		@game.get_selection(HumanPlayer)
	end

	it "updates a board after a human selects" do
		player = HumanPlayer
		selection = 4
		@game.update_board(player, selection)
		expect(@game.board.spaces).to eq([1,2,3,"X",5,6,7,8,9])
	end

	it "updates a board after a computer selects" do
		player = ComputerPlayer
		selection = 9
		@game.board.spaces = ["X",2,3,"O","X",6, 7,8,9]
		@game.update_board(player,selection)
		expect(@game.board.spaces).to eq(["X",2,3,"O","X",6, 7,8,"O"])
	end

	it "ends the game" do
		expect(CommandLineMessages).to receive(:display_computer_win)
		@game.board.spaces = [1,2,3,"O","O","O",7,"X","X"]
		@game.end_game
	end

	it "checks to see if the human won" do
		@game.board.spaces = [1,2,3,"O","O",6,"X","X","X"]
		spaces = @game.board.human_spaces
		expect(@game.person_won?(spaces)).to eq(true)
	end

	it "checks to see if game is tied" do
		@game.board.spaces = ["X","O","O","X","O","O","O","X","X"]
		expect(@game.tie_game?).to eq(true)
	end
end