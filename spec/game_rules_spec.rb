require 'game_rules.rb'

describe "Game rules" do
	let(:game_rules){GameRules.new}

	it "has a board size" do
		expect(game_rules.board_size).to be >(0)
	end

	it "has two players" do 
		expect(game_rules.players.size).to eq(2)
	end

	it "has a human marker" do 
		expect(game_rules.human_marker.length).to eq(1)
	end

	it "has a computer marker" do 
		expect(game_rules.computer_marker.length).to eq(1)
	end
end