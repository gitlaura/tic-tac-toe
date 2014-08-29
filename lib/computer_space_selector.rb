class ComputerSpaceSelector
	class << self
		def make_selection(board)
			computer_spaces = board.computer_spaces
			human_spaces = board.human_spaces
			winning_combinations = board.winning_combinations

			winning_computer_spot = find_winning_spot(computer_spaces, human_spaces, winning_combinations)
			return winning_computer_spot if !winning_computer_spot.nil?

			winning_human_spot = find_winning_spot(human_spaces, computer_spaces, winning_combinations)
			return winning_human_spot if !winning_human_spot.nil?

			select_spot(computer_spaces, human_spaces, winning_combinations)
		end

		def find_winning_spot(spaces, other_person_spaces, winning_combinations)
			winning_spot = []
			winning_combinations.each do |winning_combination|
				spots_left = winning_combination - spaces
				winning_spot = spots_left - other_person_spaces if spots_left.size == 1
				return winning_spot[0] if winning_spot.size == 1
			end
			nil
		end

		def select_spot(computer_spaces, human_spaces, winning_combinations)
			return middle_spot if middle_spot_open?(computer_spaces, human_spaces)
			return first_spot if computer_spaces.empty?
			return corner_spot(human_spaces) if sides_taken?(human_spaces)
			return top_right_corner if computer_spaces == [first_spot]
			select_open_space_in_computers_favor(computer_spaces, human_spaces, winning_combinations)
		end

		def middle_spot_open?(computer_spaces, human_spaces)
			!(computer_spaces + human_spaces).include?(middle_spot)
		end

		def sides_taken?(human_spaces)
			side_combos.each do |corner, sides|
				return true if sides == human_spaces
			end
			false
		end
				
		def corner_spot(human_spaces)
			side_combos.each do |corner, sides|
				return corner if sides == human_spaces
			end
		end

		def select_open_space_in_computers_favor(spaces, other_person_spaces, winning_combinations)
			winning_spots = []
			winning_combinations.each do |winning_combination|
				spots_left = winning_combination - spaces
				winning_spots = spots_left - other_person_spaces if spots_left.size == 2
				return winning_spots.first if winning_spots.size == 2
			end
		end

		def spots_needed_to_win
			3
		end

		def middle_spot
			5
		end

		def side_combos
			{1 => [2,4], 3 => [2,6], 7 => [4,8], 9 => [6,8]}
		end

		def first_spot
			1
		end

		def top_right_corner
			3
		end
	end
end