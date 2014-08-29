class Board
	attr_accessor :spaces
	attr_reader :winning_combinations, :human_marker, :computer_marker

	def initialize(game_rules)
		@spaces = create_board(game_rules.board_size)
		@winning_combinations = create_winning_spaces(game_rules.board_size)
		@human_marker = game_rules.human_marker
		@computer_marker = game_rules.computer_marker
	end

	def create_board(board_size)
		board_spaces = []
		(1..(board_size*board_size)).each do |board_spot|
			board_spaces << board_spot
		end
		board_spaces
	end

	def create_winning_spaces(board_size)
		rows = create_winning_row_combinations(board_size)
		columns = create_winning_column_combinations(rows)
		diagonals = create_winning_diagonal_combinations
		winning_spaces = (rows + columns + diagonals)
	end

	def create_winning_row_combinations(board_size)
		winning_rows = []
		first_row_spot, last_row_spot = 0, board_size - 1
		until last_row_spot > board_size * board_size do 
			winning_rows << @spaces[first_row_spot..last_row_spot]
			first_row_spot += board_size
			last_row_spot += board_size
		end
		winning_rows
	end

	def create_winning_column_combinations(row_combos)
		index = 1
		column_combos = row_combos[0]
		until index == row_combos.size do 
			column_combos = column_combos.zip(row_combos[index])
			index += 1
		end
		column_combos.each do |combo|
			combo.flatten!
		end
		column_combos
	end

	def create_winning_diagonal_combinations
		[[1,5,9],[3,5,7]]
	end

	def computer_spaces
		find_taken_spaces(@spaces, @computer_marker)
	end

	def human_spaces
		find_taken_spaces(@spaces, @human_marker)
	end

	def find_taken_spaces(board_spaces, marker)
		spots = board_spaces.map.with_index {|space, index| index + 1 if space == marker}
		spots.delete(nil)
		spots
	end
end