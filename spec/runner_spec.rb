require 'runner.rb'

describe "Runner" do 
	xit "runs a tic-tac-toe game" do 
		runner = Runner.new
		expect(runner).to receive(:play_game)

		runner.play_game
	end
end