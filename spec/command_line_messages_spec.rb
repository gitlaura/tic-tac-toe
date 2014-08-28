require 'command_line_messages.rb'

describe "Command line messages" do 
	it "displays a welcome to the human player" do
		expect(CommandLineMessages).to receive(:give)
		CommandLineMessages.display_welcome
	end

	it "displays the board" do
		expect(CommandLineMessages).to receive(:give).exactly(5)
		board_spaces = [1,2,3,4,5,6,7,8,9]
		CommandLineMessages.display_board(board_spaces)
	end

	it "displays human win" do
		expect(CommandLineMessages).to receive(:give)
		CommandLineMessages.display_human_win
	end

	it "displays computer win" do
		expect(CommandLineMessages).to receive(:give)
		CommandLineMessages.display_computer_win
	end

	it "displays tie game" do
		expect(CommandLineMessages).to receive(:give)
		CommandLineMessages.display_tie
	end
end