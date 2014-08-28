require 'runner.rb'

describe "Runner" do 
	it "runs a tic-tac-toe game until it's over" do 
		runner = Runner.new
		expect(runner.game).to receive(:welcome)
		expect(runner.game).to receive(:game_over?){true}
		expect(runner.game).to receive(:end_game)
		runner.play_game
	end
end