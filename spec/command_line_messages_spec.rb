require 'command_line_messages.rb'

describe "Command line messages" do 
	let(:board_spaces){[1,2,3,4,5,6,7,8,9]}

	it "displays a welcome to the human player" do
		expect(CommandLineMessages).to receive(:give).twice
		CommandLineMessages.display_welcome
	end

	it "displays the board" do
		expect(CommandLineMessages).to receive(:give).exactly(6)
		CommandLineMessages.display_board(board_spaces)
	end

	it "requests a selection" do
		expect(CommandLineMessages).to receive(:give).twice
		expect(CommandLineMessages).to receive(:receive)
		CommandLineMessages.request_selection
	end

	it "displays invalid selection" do
		expect(CommandLineMessages).to receive(:give).twice
		CommandLineMessages.display_invalid_selection
	end

	it "displays human win" do
		expect(CommandLineMessages).to receive(:give).exactly(9)
		CommandLineMessages.display_human_win(board_spaces)
	end

	it "displays computer win" do
		expect(CommandLineMessages).to receive(:give).exactly(9)
		CommandLineMessages.display_computer_win(board_spaces)
	end

	it "displays tie game" do
		expect(CommandLineMessages).to receive(:give).exactly(9)
		CommandLineMessages.display_tie(board_spaces)
	end
end