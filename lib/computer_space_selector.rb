class ComputerSpaceSelector
	class << self
		def make_selection(computer_spaces, human_spaces, winning_combinations)
			winning_computer_combo = find_computer_winning_combo(computer_spaces, human_spaces, winning_combinations)
			return select_computer_winning_spot(computer_spaces, winning_computer_combo) if !winning_computer_combo.nil?

			winning_human_combo = find_human_winning_combo(human_spaces, computer_spaces, winning_combinations)
			return block_human_from_winning(human_spaces, winning_human_combo) if !winning_human_combo.nil?

			select_spot(computer_spaces, human_spaces, winning_combinations)
		end

		def find_computer_winning_combo(computer_spaces, human_spaces, winning_combinations)
			find_winning_combo(computer_spaces, human_spaces, winning_combinations)
		end

		def find_human_winning_combo(human_spaces, computer_spaces, winning_combinations)
			find_winning_combo(human_spaces, computer_spaces, winning_combinations)
		end

		def find_winning_combo(spaces, other_person_spaces, winning_combinations)
			matches = 0
			winning_combinations.each do |winning_combination|
				spaces.each do |space|
					if winning_combination.include?(space)
						matches += 1
						return winning_combination if matches == spots_needed_to_win - 1 && valid_winning_combo?(winning_combination, other_person_spaces)
					end
				end
				matches = 0
			end	
			nil
		end

		def valid_winning_combo?(winning_combination, other_person_spaces)
			winning_combination.each do |winning_space|
				return false if other_person_spaces.include?(winning_space)
			end
			true
		end

		def select_computer_winning_spot(computer_spaces, winning_combination)
			select_winning_spot(computer_spaces, winning_combination)
		end

		def block_human_from_winning(human_spaces, winning_combination)
			select_winning_spot(human_spaces, winning_combination)
		end

		def select_winning_spot(taken_spaces, winning_combination)
			winning_combination.each do |winning_space|
				return winning_space if !taken_spaces.include?(winning_space)
			end
		end

		def select_spot(computer_spaces, human_spaces, winning_combinations)
			return middle_spot if middle_spot_open?(computer_spaces, human_spaces)
			return first_spot if computer_spaces.empty?
			select_open_space_in_computers_favor(computer_spaces, human_spaces, winning_combinations)
		end

		def middle_spot_open?(computer_spaces, human_spaces)
			!computer_spaces.include?(middle_spot) && !human_spaces.include?(middle_spot)
		end

		def select_open_space_in_computers_favor(computer_spaces, human_spaces, winning_combinations)
			possible_winning_combos = find_possible_winning_combinations(computer_spaces, winning_combinations)
			all_taken_spaces = computer_spaces + human_spaces
			selection = select_open_spot_in_combo(all_taken_spaces, possible_winning_combos)
		end

		def find_possible_winning_combinations(spaces, winning_combinations)
			possible_winning_combos = []
			winning_combinations.each do |winning_combination|
				spaces.each do |taken_space|
					if winning_combination.include?(taken_space)
						possible_winning_combos << winning_combination
					end
				end
			end
			possible_winning_combos
		end

		def select_open_spot_in_combo(all_taken_spaces, possible_winning_combos)
			possible_winning_combos.each do |possible_combo|
				possible_combo.each do |possible_space|
					return possible_space if !all_taken_spaces.include?(possible_space)
				end
			end
		end

		def spots_needed_to_win
			3
		end

		def middle_spot
			5
		end

		def first_spot
			1
		end
	end
end