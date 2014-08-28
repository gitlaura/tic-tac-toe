require 'board.rb'

describe "Board" do
	it "creates an array with 9 empty spots" do
		board = Board.new

		expect(board.spaces.size).to be(9)
	end
end